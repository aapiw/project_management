class Api::V100::User::ApiController < Api::V100::ApiController
  before_action :authorize_user!

  def authorize_user!
    if @current_user.blank?  
      render json: { error: "Unauthorized" }, status: :unauthorized
      return
    end
  end

end   