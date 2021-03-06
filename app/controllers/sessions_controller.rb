class SessionsController < ApplicationController
  skip_before_filter :login_required, :except => "destroy"

  def new
    @hackathons = Hackathon.all
    render :layout => 'landing_page'
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), :notice => "Logged in!"  
    else
      redirect_to login_path, :notice => "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Logged out!"
  end
end
