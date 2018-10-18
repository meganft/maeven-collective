class Organizations::OfferingsController < ApplicationController

  def show
    @offering = Offering.find_by(slug: params[:slug])
    # @offering = Offering.find(params[:id])
  end

end
