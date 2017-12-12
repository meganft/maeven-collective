class LandingController < ApplicationController

  def index
    @organizations = Organization.all
    @offerings = Offering.all
  end
end
