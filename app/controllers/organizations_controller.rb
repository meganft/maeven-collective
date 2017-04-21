class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find(params[:id])
  end

  def index
    @organizations = Organization.all
    @featured = Organization.last
  end

end
