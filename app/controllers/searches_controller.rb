class SearchesController < ApplicationController

  def index
    if params[:keyword] != nil && params[:keyword].strip != ""
      results = Post.all
      keywords = params[:keyword].split(/[ 　]/)

      keywords.each do |keyword|
        results = results.where("posts.content LIKE ?", "%#{keyword}%")
      end

      @users = User.all

      render turbo_stream: turbo_stream.replace(
        'result-posts',
        partial: 'shared/result-posts',
        locals: { posts: results, users: @users },
      )
    end
  end
  
end
