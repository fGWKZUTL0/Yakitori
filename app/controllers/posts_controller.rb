class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    #@id = params[:id]
    @post = Post.find_by(id: params[:id])
  end

  def new

  end

  def create
    @post = Post.new(user_id: params[:user_id], content: params[:content])
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

  def mypage
    if logged_in?
      logged_user = User.find_by(id: session[:user_id])
      @posts = Post.where(user_id: logged_user.user_id)
    else
      redirect_to(login_path)
    end
  end

end
