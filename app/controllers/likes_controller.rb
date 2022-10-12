class LikesController < ApplicationController
  before_action :post_params
  def create
    post = Post.find(params[:id])
    like = current_user.likes.new(post_id: post.id)
    like.save

    @users = User.all
    #redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    like = current_user.likes.find_by(post_id: post.id)
    like.destroy
    
    @users = User.all
    #redirect_to posts_path
  end

  def post_params
    @post = Post.find(params[:id])
  end
end
