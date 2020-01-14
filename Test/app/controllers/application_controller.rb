class ApplicationController < ActionController::API
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  authorize_resource class: false

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
       !current_user.nil?
  end

  def authorized
   redirect_to '/welcome' unless logged_in?
  end

  def current_ability
    @current_ability ||= Samurai::Ability.new(current_user)
  end
  rescue_from CanCan::AccessDenied do |exception|
    render :file => 'static/403.html', :status => 403, :layout => false
  end

end
