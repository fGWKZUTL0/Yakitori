class SearchesController < ApplicationController

  def index
    if params[:keyword] != nil
      @results = Post.where("posts.content LIKE ?", "%#{params[:keyword]}%")
      @users = User.all

      render turbo_stream: turbo_stream.replace(
        'result',
        partial: 'shared/result',
        locals: { posts: @results, users: @users },
      )
    end
  end

end
