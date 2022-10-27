class LikesController < ApplicationController
  before_action :post_params
  def create
    post = Post.find(params[:id])
    like = current_user.likes.new(post_id: post.id)
    like.save

    @this_user = User.all.find_by(username: post.username)
    @users = User.all
    #redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    like = current_user.likes.find_by(post_id: post.id)
    like.destroy
    
    @this_user = User.all.find_by(username: post.username)
    @users = User.all
    #redirect_to posts_path
  end

  def post_params
    @post = Post.find(params[:id])
  end
end
