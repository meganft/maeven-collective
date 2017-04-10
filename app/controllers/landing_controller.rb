class LandingController < ApplicationController
  def index
    @featured = Offering.first
  end
end
