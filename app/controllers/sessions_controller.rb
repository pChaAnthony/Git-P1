class SessionsController < ApplicationController
	skip_before_filter :authorize

  def new
  end

  def create
	user = User.find_by(user: params[:name])
	if user and user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect_to admin_url
	else
		redirect_to login_url, alert: "Invalid user or password"
	end
  end

  def destory
	session[:user_id] = nil
	redirect_to blog_url, notice: "Logged out"
  end
end
