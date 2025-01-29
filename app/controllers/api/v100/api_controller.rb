class Api::V100::ApiController < ActionController::API
  before_action :authenticate_user!, except: :login

  def authenticate_user!
    header = request.headers['Authorization']
    begin
      decoded = JsonWebToken.decode(header)
      user = User.find(decoded[:user_id])
      if user&.role.eql?("admin")
        @current_admin = user
      else
        @current_user = user
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {success:false, message: e.message}, status: :not_found
    rescue JWT::DecodeError => e 
      render json: {success:false, message: e.message}, status: :bad_request
    rescue JWT::ExpiredSignature => e
      render json: {success:false, message: e.message}, status: :unauthorized
    end
  end

  def render_error(status, message)
    render json: {
      succes: false,
      status: status,
      message: message,
    }, status: status
  end

end   