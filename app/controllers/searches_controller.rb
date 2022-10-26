class SearchesController < ApplicationController
  def index
    if params[:keyword] != nil
      @results = Post.where(content: params[:keyword])
      @users = User.all
    end
  end

  def search

  end
end
