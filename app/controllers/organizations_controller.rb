class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find(params[:id])
  end

  def index
    @categories = Category.all
    @featured = Organization.last
    if params[:category]
      @organizations = Organization.filter(params[:category][:category_id])
      @organizations = @organizations.paginate(:page => params[:page], :per_page => 15)
    else
      @organizations = Organization.paginate(:page => params[:page], :per_page => 15).order('name ASC')
    end
    if params[:sort]
      sort_orgs
    end
    if params[:search]
      search_orgs
    end
  end

  private

    def sort_orgs
      if params[:sort][:sort_order] == "Alphabetical (Z-A)"
        @organizations = Organization.paginate(:page => params[:page], :per_page => 15).order('name DESC')
      else
        @organizations = Organization.paginate(:page => params[:page], :per_page => 15).order('name ASC')
      end
    end

    def search_orgs
      @organizations = Organization.by_search(params[:search]).order('name ASC')
      @organizations = @organizations.paginate(:page => params[:page], :per_page => 15)
    end

end
