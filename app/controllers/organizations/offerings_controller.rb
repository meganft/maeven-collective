class Organizations::OfferingsController < ApplicationController

  def show
    @offering = Offering.find(params[:id])
  end

end
