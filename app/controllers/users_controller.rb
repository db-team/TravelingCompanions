class UsersController < ApplicationController
  before_action :check_authorization, only: [:edit, :update]
    
  def index
    Rails.logger.info request.env["HTTP_COOKIE"]
  end
    
  def create
    @user = User.new user_params
    
    if @user.save
      flash[:success] = "Created success!" 
      redirect_to root_path
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      redirect_to root_path
    end
  end
    
  private
  def user_params
    params.require(:user).permit(:username, :password, :email) 
  end
    
  def check_authorization
    unless current_user.id == params[:id].to_i
     	flash[:error] = "You shouldn't try to edit another profile"
			redirect_to root_path
		end 
  end
end
