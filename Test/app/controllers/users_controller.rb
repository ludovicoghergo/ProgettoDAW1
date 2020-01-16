class UsersController < ApplicationController
skip_before_action :authorized, only: [:new, :create, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:fname,:lname,:age,:sex,:username,:email,:password,:city,:state,:zip))
    @user.save
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def show
    @user = User.find(session[:user_id])
  end
end
