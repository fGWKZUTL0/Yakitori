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
    @user = User.find_by(id: params[:id])
  end

  def update
    users = User.all
    @user = User.find_by(id: params[:id])
    @user.update(bio: params[:bio])
    if params[:icon] != nil
      @user.update(icon: params[:icon])
    end

    @posts = Post.all.where(username: @user.username).order(created_at: :desc)

    render turbo_stream:[ turbo_stream.replace(
        'turbo-frame-user-profile',
        partial: 'shared/profile',
        locals: { this_user: @user },
      ),
      turbo_stream.replace(
        "timeline",
        partial: 'shared/TimeLine',
        locals: { posts: @posts, users: users}, 
      )
    ]
    #redirect_to("/posts/#{@user.username}/profile")
  end

  def destroy
    Post.where(username: current_user.username).destroy_all
    current_user.destroy
    redirect_to signup_path
  end

  def profile
    @posts = Post.all.where(username: params[:username]).where(parent_id: -1).order(created_at: :desc)
    @this_user = User.find_by(username: params[:username])
    @users = User.all
  end

  def search
    #@posts = Post.all.where(username: params[:username]).order(created_at: :desc)
    @this_user = User.find_by(username: params[:username])
    @users = User.all

    case params[:tab_type]
    when "posts" then
      @posts = Post.all.where(username: params[:username]).where(parent_id: -1).order(created_at: :desc)

      render turbo_stream: turbo_stream.replace(
        'timeline',
        partial: 'shared/TimeLine',
        locals: { posts: @posts, users: @users },
      )
    when "replies" then
      @posts = Post.all.where(username: params[:username]).where.not(parent_id: -1).order(created_at: :desc)

      render turbo_stream: turbo_stream.replace(
        'timeline',
        partial: 'shared/TimeLine',
        locals: { posts: @posts, users: @users },
      )
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :icon)
    end

end
