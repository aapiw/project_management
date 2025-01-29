class Api::V100::User::ProjectsController < Api::V100::User::ApiController
  before_action :set_projects

  def index
    rescue StandardError => e
      render_error(500, "Something went wrong: #{e.message}")
  end

  def assign_tasks
    @project = @projects&.active&.find(params[:id])
    @project.assign_tasks params[:task_ids] 

    rescue StandardError => e
      render_error(500, "Something went wrong: #{e.message}")
  end

  def unassign_tasks
    @project = @projects&.active&.find(params[:id])
    @project.unassign_tasks params[:task_ids] 

    rescue StandardError => e
      render_error(500, "Something went wrong: #{e.message}")
  end

  private
  
  def set_projects
    @projects = @current_user.projects
  end

end
