class ApplicationController < ActionController::API
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :is_admin?
  helper_method :find_author
  helper_method :find_product

  def find_product(id)
    return  Product.find(id)
  end

  def find_author(id)
    return  User.find(id)
  end

  def is_admin?
    return current_user.admin
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
       !current_user.nil?
  end

  def authorized
   redirect_to '/login_required' unless logged_in?
  end

  def auth_admin
    redirect_to '/admin_auth_required' unless logged_in? && is_admin?
  end

end
