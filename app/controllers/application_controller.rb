class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_admin?
  helper_method :determine_authorization
  before_filter :add_orgs_data

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def determine_authorization(user)
    if user.admin?
      admin_dashboard_path
    else
      root_path
    end
  end

  def add_orgs_data
    @orgs_data =Organization.all.pluck(:name)
  end

end
