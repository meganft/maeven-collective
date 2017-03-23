class Admin::OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to admin_dashboard_path(current_user)
      flash[:success] = "Created new organization #{@organization.name}"
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :website, :twitter, :instagram, :facebook)
    end

end
