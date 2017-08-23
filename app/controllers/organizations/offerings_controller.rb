class Organizations::OfferingsController < ApplicationController

  def show
    @offering = Offering.find(params[:id])
    @similar = Offering.search_format(@offering.format)
    @similar.delete(@offering) if @similar.include?(@offering)
  end

end
