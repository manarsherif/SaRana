class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  protected
  def authorize
   @user = User.find_by(id: session[:user_id])
   unless @user
   	redirect_to login_url, notice: "Kindly Login to have access"
  end
end
end
