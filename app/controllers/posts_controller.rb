class PostsController < ApplicationController
  def index
    #フォローしているユーザーと自分のpostのみを取得する
    @posts = getTimeline(session[:user_id])
    @users = User.all

  end

  def show
    #@id = params[:id]
    @post = Post.find_by(id: params[:id])
    @users = User.all
    @this_user = User.find_by(username: @post.username)
  end

  def new

  end

  def create
    @this_user = User.find_by(username: params[:username])

    if params[:parent_id] != nil
      #リプライ
      @post = Post.new(username: params[:username], content: params[:content], parent_id: params[:parent_id])
      @post.save
      parent_post = Post.find_by(id: params[:parent_id])
      parent_post_user = User.find_by(username: parent_post.username)

      redirect_to "/posts/#{getEndOfParentId(@post)}"
    elsif
      #リプライではない普通のツイート
      @post = Post.new(username: params[:username], content: params[:content], parent_id: -1)
      @post.save

      render turbo_stream: turbo_stream.replace(
        "new_post",
        partial: 'shared/new_post',
        locals: { post: @post, this_user: @this_user},
      )
    end
    #redirect_to("/posts/index")
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

  private 
    def getTimeline(user_id)
      followed_id_lists = Follow.where(follower_id: user_id).select(:followed_id)
      username_lists = User.where(id: followed_id_lists).or(User.where(id: user_id)).select(:username)
      @posts = Post.where(username: username_lists).where(parent_id: -1).order(created_at: :desc)
    end

    def getFollows(user_id)
      followed_id_lists = Follow.where(follower_id: user_id).select(:followed_id)
      @users = User.where(id: followed_id_lists).or(User.where(id: user_id))
    end

    def getEndOfParentId(post)
      while post.parent_id != -1
        post = Post.all.find_by(id: post.parent_id)
      end
      post.id
    end
end
