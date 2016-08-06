class SessionsController < ApplicationController
	def create
    if @user = User.find_by(username: params[:username]) || User.find_by(email: params[:username])
      if @user.authenticate(params[:password])
		    session[:user_id] = @user.id
		    redirect_to root_path
	    else
	      flash[:error] = "Wrong password!"
	      redirect_to root_path
    	end
    else
     flash[:error] = "Enter full username/password man!"
     redirect_to root_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end
end
