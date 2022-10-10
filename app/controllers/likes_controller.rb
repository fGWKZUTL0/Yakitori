class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    like = current_user.likes.new(post_id: post.id)
    like.save
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    like = current_user.likes.find_by(post_id: post.id)
    like.destroy
    redirect_to posts_path
  end
end