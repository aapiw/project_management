class Api::V100::Admin::ApiController < Api::V100::ApiController
  before_action :authorize_admin!

  def authorize_admin!
    if @current_admin.blank?  
      render json: { error: "Unauthorized" }, status: :unauthorized
      return
    end
  end

end   