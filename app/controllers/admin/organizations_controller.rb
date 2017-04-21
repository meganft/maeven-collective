class Admin::OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
    @organizations_categories = @organization.organizations_categories.new
    @categories = Category.all
  end

  def create
    @organization = Organization.new(organization_params)
    categories = params[:organization][:organizations_category][:category_id]
    categories = categories.reject {|t| t.empty? }
    if !categories.empty?
      categories.each do |id|
        @organization.categories << Category.find(id)
      end
    end
    if @organization.save
      redirect_to admin_dashboard_path(current_user)
      flash[:success] = "Created new organization #{@organization.name}"
    else
      flash.now[:error] = @organization.errors.full_messages.first
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def edit
    @organization = Organization.find(params[:id])
    @organizations_categories = @organization.organizations_categories.new
    @categories = Category.all
  end

  def update
    @categories = Category.all
    @organization = Organization.find(params[:id])
    @organizations_categories = @organization.organizations_categories
    @organization.update(organization_params)
    flash[:success] = "Successfully updated #{@organization.name}"
    redirect_to admin_dashboard_path
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :website, :twitter, :instagram, :facebook, :description, :history, :avatar, :categories, category_ids: [:id, :name])
    end

end
