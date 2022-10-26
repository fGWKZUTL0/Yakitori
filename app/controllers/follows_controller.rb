class FollowsController < ApplicationController
  
  def create
    @this_user = User.find_by(id: params[:user_id])
    current_user.follow(params[:user_id])
    #redirect_to request.referer

    render turbo_stream: turbo_stream.replace(
      'follow_button',
      partial: 'shared/follow_button',
      locals: { this_user: @this_user },
    )
  end
  # フォロー外すとき
  def destroy
    @this_user = User.find_by(id: params[:user_id])
    current_user.unfollow(params[:user_id])
    #redirect_to request.referer

    render turbo_stream: turbo_stream.replace(
      'follow_button',
      partial: 'shared/follow_button',
      locals: { this_user: @this_user },
    )
  end
  # フォロー一覧
  def followings
    user_id = User.find_by(username: params[:username])
    followed_id_lists = Follow.where(follower_id: user_id).select(:followed_id)
    @users = User.where(id: followed_id_lists)
  end
  # フォロワー一覧
  def followers
    user_id = User.find_by(username: params[:username])
    follower_id_lists = Follow.where(followed_id: user_id).select(:follower_id)
    @users = User.where(id: follower_id_lists)
  end
  
end
