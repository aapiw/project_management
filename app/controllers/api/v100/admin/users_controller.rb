class Api::V100::Admin::UsersController < Api::V100::Admin::ApiController
  def index
    @users = User.where(role: :user)
    
    rescue StandardError => e
      render_error(500, "Something went wrong: #{e.message}")
  end


end
