class SessionsController < ApplicationController
  #login
  
  skip_before_action :authorize
  def new
  end

  def create
  	user=User.find_by(username: params[:username])

  	if user and user.authenticate(params[:password])
  	session[:user_id]=user.id
  	redirect_to materials_url
  else
  	redirect_to login_url, alert:"Invalid Username or Password"
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "Logged Out"
  end
end
end