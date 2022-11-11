class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]

  def new
    if logged_in?
      redirect_to profile_path(session[:user_id])
    end
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to "/profile/#{user.username}"
    else
      flash.now[:danger] = 'メールアドレスかパスワードが間違っています。'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
