class Project < ApplicationRecord
  has_many :project_assignments
  has_many :users, through: :project_assignments
  has_many :tasks

  scope :active, -> { where("start_date <= ? AND end_date >= ?", Date.current, Date.current) }
  before_save :set_end_date


  def set_end_date
    if will_save_change_to_start_date? || will_save_change_to_duration?
      self.end_date = DurationParser.find_end_date(start_date, duration)
    end
  end

  def assign_users user_ids
    user_ids&.each do |user_id|
      user = User.find user_id
      exists = self.user_ids.include?(user.id)
      self.users << user unless exists
    end
  end

  def unassign_users user_ids
    user_ids&.each do |user_id|
      user = User.find user_id
      exists = self.user_ids.include?(user.id)
      self.users.delete(user_id) if exists
    end
  end


  def assign_tasks task_ids
    task_ids&.each do |task_id|
      task = Task.find task_id
      exists = self.task_ids.include?(task.id)
      self.tasks << task unless exists
    end
  end

  def unassign_tasks task_ids
    task_ids&.each do |task_id|
      task = Task.find task_id
      exists = self.task_ids.include?(task.id)
      self.tasks.delete(task_id) if exists
    end
  end


  def self.display_hour hour
    hour.present? && hour > 1 ? "#{hour} hours" : "hour"
  end

end
