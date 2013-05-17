class SessionsController < ApplicationController
  
  skip_before_filter :require_login, :only => [:create]

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "You are successfully logged as #{user.email}"
    else
      flash.now[:alert] = "Invalid username or password"
      render :action => "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end