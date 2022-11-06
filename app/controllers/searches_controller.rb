class SearchesController < ApplicationController

  def index
    if params[:keyword] != nil && params[:keyword].strip != ""

      @users = User.all
      keywords = params[:keyword].split(/[ 　]/)

      case params[:tab_type]
      when "posts" then
        posts_results = Post.all
        
        keywords.each do |keyword|
          posts_results = posts_results.where("posts.content LIKE ?", "%#{keyword}%")
        end
  
        render turbo_stream: turbo_stream.replace(
          'result',
          partial: 'shared/result_posts',
          locals: { posts: posts_results, users: @users },
        )
      when "users" then
        name_results = User.all
        username_results = User.all

        keywords.each do |keyword|
          name_results = name_results.where("users.name LIKE ?", "#{keyword}%")
          username_results = username_results.where("users.username LIKE ?", "#{keyword}%")
        end

        render turbo_stream: turbo_stream.replace(
          'result',
          partial: 'shared/follow_list',
          locals: { users: (name_results + username_results) },
        )
      end
    end
  end
  
end
