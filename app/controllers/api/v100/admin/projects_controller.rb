class Api::V100::Admin::ProjectsController < Api::V100::Admin::ApiController
  def index
    if params[:active] == "true"
      @projects = Project.active.includes(:tasks, :users)
      @users = User.where(role:"user")
    else
      @projects = Project.all
    end
    
    rescue StandardError => e
      render_error(500, "Something went wrong: #{e.message}")
  end

  

  def assign_users
    @project = Project.find(params[:id])
    @project.assign_users params[:user_ids] 
    rescue StandardError => e
      render_error(500, "Something went wrong: #{e.message}")
  end

  def unassign_users
    @project = Project.find(params[:id])
    @project.unassign_users params[:user_ids]

    rescue StandardError => e
      render_error(500, "Something went wrong: #{e.message}")

  end


end
