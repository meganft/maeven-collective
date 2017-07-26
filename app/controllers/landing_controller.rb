class LandingController < ApplicationController

  def index
    @organizations = Organization.all
    @organization = Organization.new
    @featured = Offering.first
  end
end
