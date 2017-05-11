class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find(params[:id])
  end

  def index
    @categories = Category.all
    if params[:category]
      @organizations = Organization.filter(params[:category][:category_id])
      @organizations = @organizations.paginate(:page => params[:page], :per_page => 15)
    else
      @organizations = Organization.paginate(:page => params[:page], :per_page => 15)
    end
    if params[:search]
      @organizations = Organization.by_search(params[:search])
      @organizations = @organizations.paginate(:page => params[:page], :per_page => 15)
    end
    @featured = Organization.last
  end

end
