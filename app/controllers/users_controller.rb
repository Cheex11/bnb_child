class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if !session[:user_id].nil?
    @user = User.find(params[:id])
   end
  end


  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end
end
