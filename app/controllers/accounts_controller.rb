class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to profile_path(@account)
    else
      render 'new'
    end
  end

  def sign_in
  end

  def sign_in_process
  end

  private
    def user_params
      params.require(:account).permit(:name, :email, :password, :password_confirmation)
    end
end
