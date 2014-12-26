class UsersController < ApplicationController
   before_filter :authenticate_user!
  #skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
    @hash = Digest::MD5.hexdigest("nicknarh@gmail.com")
  end

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)
    binding.pry

    if @user.save
      UserMailer.welcome_email(@user).deliver
    end

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
