class Admin::OrganizationsController < ApplicationController

  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def new
    @organization = Organization.new
    @organizations_categories = @organization.organizations_categories.new
    @categories = Category.all
  end

  def create
    @organization = Organization.new(organization_params)
    categories = params[:organization][:organizations_category][:category_id]
    categories = categories.reject {|t| t.empty? }
    categories.each {|id| @organization.categories << Category.find(id) } if !categories.empty?
    if @organization.save
      redirect_to admin_dashboard_path(current_user)
      flash[:success] = "Created new organization #{@organization.name}"
    else
      flash.now[:error] = @organization.errors.full_messages.first
      render :new
    end
  end

  def show
  end

  def edit
    @organizations_categories = @organization.organizations_categories
    @categories = Category.all
  end

  def update
    @categories = Category.all
    @organization.update(organization_params)
    categories = params[:organization][:organizations_categories][:category_id]
    @organization.categories = []
    categories = categories.reject {|t| t.empty? }
    categories.each {|id| @organization.categories << Category.find(id) } if !categories.empty?
    flash[:success] = "Successfully updated #{@organization.name}"
    redirect_to admin_organization_path(@organization)
  end

  private

    def organization_params
      params.require(:organization).permit(:name,
        :website,
        :twitter,
        :instagram,
        :facebook,
        :description,
        :history,
        :avatar,
        :organizations_category,
        :categories,
        category_ids: [:id, :name])
    end

    def set_organization
      @organization = Organization.find(params[:id])
    end

end
