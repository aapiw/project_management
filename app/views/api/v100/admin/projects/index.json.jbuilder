json.status 200
json.success true

json.data @projects do |project|
  json.id project.id
  json.name project.name
  json.start_date project.start_date
  json.duration project.duration
  
  json.total_task_duration Project.display_hour(project&.tasks&.pluck(:duration)&.reduce(:+))

  users = project.users
  json.assigned_users users do |user|
    json.id user.id
    json.name user.name
    json.role user.role
  end

  json.available_users @users do |user|
    next if project.users&.include?(user)
    json.id user.id
    json.name user.name
    json.role user.role
  end

end
