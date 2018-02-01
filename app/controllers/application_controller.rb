class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    unless current_user && curent_user.admin
      render json: {message: 'you are unauthorized, knuckle head'}, status: :unauthorized
    end
  end
end
