class Admin::OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
    @organizations_categories = @organization.organizations_categories.new
    @categories = Category.all
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to admin_dashboard_path(current_user)
      flash[:success] = "Created new organization #{@organization.name}"
    else
      flash.now[:error] = @organization.errors.full_messages.first
      render :new
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update(organization_params)
    flash[:success] = "Successfully updated #{@organization.name}"
    redirect_to admin_dashboard_path
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :website, :twitter, :instagram, :facebook, :description, :avatar)
    end

end
