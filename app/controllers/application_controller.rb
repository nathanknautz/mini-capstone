class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    unless current_user && current_user.admin
      render json: {errors: 'you are unauthorized, knuckle head'}, status: :unauthorized
    end
  end
end
