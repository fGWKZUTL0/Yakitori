class UsersController < ApplicationController
  require 'securerandom'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.user_id = p SecureRandom.base64(8)

    if @user.save
      redirect_to profile_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to signup_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
