class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    like = current_user.likes.new(post_id: @post.id)
    like.save

    render turbo_stream: turbo_stream.replace('likes', partial: 'likes')
    #redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy

    render turbo_stream: turbo_stream.replace('likes', partial: 'likes')
    #redirect_to posts_path
  end
end
