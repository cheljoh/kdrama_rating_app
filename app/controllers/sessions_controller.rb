class SessionsController < ApplicationController

  def new

  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      # flash[:error] = "Incorrect username and/or password"
      render :new
    end
    # if @user && @user.authenticate(params[:session][:password]) #user exists in db and pw is ok
    #   session[:user_id] = @user.id #could have this in model, but in string for the path. Would call user.dashboard path
    #   if @user.admin?
    #     redirect to admin_path
    #   else
    #     redirect_to user_path(@user)
    #   end
    # else
    #   render :new
    # end
  end

end
