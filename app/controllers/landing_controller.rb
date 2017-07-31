class LandingController < ApplicationController

  def index
    @organizations = Organization.all
    @organization = Organization.new
    featured = Offering.all
    @featured_first = featured[0..3]
    @featured_second = featured[4..7]
    @featured_third = featured[8..11]
  end
end
