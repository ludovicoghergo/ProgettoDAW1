class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome,:page_requires_login,:page_requires_admin,:login_user,:login_admin]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      return 1
    else
      return 0
    end
  end

  def login
  end

  def welcome
  end


  def login_user
    if create
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def login_admin
    if create && logged_in? && is_admin?
      redirect_to '/admin/index'
    else
      redirect_to '/admin'
    end
  end

end
