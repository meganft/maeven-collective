class Admin::DashboardController < ApplicationController

  before_action :require_admin

  def require_admin
    render file: 'public/404' unless current_admin?
  end

  def show
    if params[:search]
      @organizations = Organization.search(params[:search])
    else
      @organizations = Organization.all
    end
  end

end
