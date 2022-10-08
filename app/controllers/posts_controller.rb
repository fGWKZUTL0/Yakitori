class PostsController < ApplicationController
  def index
    #フォローしているユーザーと自分のpostのみを取得する
    @posts = getTimeline(session[:user_id])
    @users = User.all

  end

  def show
    #@id = params[:id]
    @post = Post.find_by(id: params[:id])
    @this_user = User.find_by(username: @post.username)
  end

  def new

  end

  def create
    @post = Post.new(username: params[:username], content: params[:content])
    @post.save

    redirect_to("/posts/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(content: params[:content])

    redirect_to("/posts/index")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    redirect_to("/posts/index")
  end

  def profile
    @posts = Post.all.where(username: params[:username]).order(created_at: :desc)
    @this_user = User.find_by(username: params[:username])
    @users = User.all
  end

  private 
    def getTimeline(user_id)
      followed_id_lists = Follow.where(follower_id: user_id).select(:followed_id)
      username_lists = User.where(id: followed_id_lists).or(User.where(id: user_id)).select(:username)
      @posts = Post.where(username: username_lists).order(created_at: :desc)
    end
end
