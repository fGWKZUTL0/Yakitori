class SearchesController < ApplicationController

  def index

    if params[:keyword] != nil
      params[:keyword].strip!

      results = Post.all
      keywords = params[:keyword].split(/[ 　]/)

      keywords.each do |keyword|
        results = results.where("posts.content LIKE ?", "%#{keyword}%")
      end

      @users = User.all

      render turbo_stream: turbo_stream.replace(
        'result',
        partial: 'shared/result',
        locals: { posts: results, users: @users },
      )
    end
  end

end
