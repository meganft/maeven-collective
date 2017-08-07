class LandingController < ApplicationController

  def index
    @organizations = Organization.all
    @organization = Organization.new
    featured = Offering.all
    @featured_first = featured[0..2]
    @featured_second = featured[3..6]
    @featured_third = featured[7..10]
  end
end
