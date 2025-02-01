class Api::V100::User::TasksController < Api::V100::User::ApiController
  def index
    @assigned_tasks = Task.where.not(project_id:nil)
    @available_tasks = Task.where(project_id:nil)
    
    rescue StandardError => e
      render_error(500, "Something went wrong: #{e.message}")
  end


end
