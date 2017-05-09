class LandingController < ApplicationController

  def index
    @organizations = Organization.all
    @featured = Offering.first
  end
end
