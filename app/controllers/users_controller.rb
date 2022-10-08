class UsersController < ApplicationController
  require 'securerandom'
  before_action :require_login, only: [:show, :destroy]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    user.username = p SecureRandom.hex(5)

    if user.save
      log_in(user)
      redirect_to profile_path(user)
    else
      render 'new'
    end
  end

  def show
    #@user = User.find(params[:id])
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find_by(username: params[:username])
    @user.update(bio: params[:bio])
    if params[:icon] != nil
      @user.update(icon: params[:icon])
    end

    redirect_to("/posts/#{@user.username}/profile")
  end

  def destroy
    Post.where(username: current_user.username).destroy_all
    current_user.destroy
    redirect_to signup_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :icon)
    end

end
