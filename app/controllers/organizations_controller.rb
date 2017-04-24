class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find(params[:id])
  end

  def index
    @categories = Category.all
    if params[:category]
      @organizations = Organization.filter(params[:category][:category_id])
    else
      @organizations = Organization.paginate(:page => params[:page], :per_page => 12)
    end
    @featured = Organization.last
  end

end
