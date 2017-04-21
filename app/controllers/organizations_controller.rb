class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find(params[:id])
  end

  def index
    if params[:category]
      @organizations = Organization.filter(params[:category][:category_id])
    else
      @organizations = Organization.all
    end
    @featured = Organization.last

  end

end
