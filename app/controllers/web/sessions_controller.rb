class Web::SessionsController < Web::ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:new, :create]

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to root_path, notice: "You are successfully logged as #{user.email}"
    else
      flash.now[:alert] = "Invalid username or password"
      render :action => "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end