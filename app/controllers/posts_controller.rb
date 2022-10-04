class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @users = User.all
  end

  def show
    #@id = params[:id]
    @post = Post.find_by(id: params[:id])
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
end
