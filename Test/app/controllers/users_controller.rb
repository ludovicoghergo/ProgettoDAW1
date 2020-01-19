class UsersController < ApplicationController
skip_before_action :authorized, only: [:new, :create, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:fname,:lname,:age,:sex,:username,:email,:password,:state,:zip))
    @user.save
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def delete
    @target.destroy
  end

  def delete_account
    @target = User.find(session[:user_id])
    delete
    redirect_to '/welcome'
  end
  def update_avatar
    @user = User.find(session[:user_id])
    @user.avatar.attach(params[:avatar])
    @user.save
  end

  def update_user
    @user = User.find(session[:user_id])
    @user.update(fname: params[:fname],lname: params[:lname],age: params[:age],sex: params[:sex], username: params[:username], email: params[:email],state: params[:state], zip: params[:zip])

  end

  def show
    @user = User.find(session[:user_id])
  end
end
