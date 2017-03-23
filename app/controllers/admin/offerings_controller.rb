class Admin::OfferingsController < ApplicationController
  def new
    @organization = Organization.find(params[:organization])
    @offering = @organization.offerings.new
  end

  def create
    @organization = Organization.find(params[:organization])
    @offering = @organization.offerings.new(offering_params)
    if @offering.save
      redirect_to admin_dashboard_path(current_user)
      flash[:success] = "Created new offering #{@offering.name}"
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end

  private
    def offering_params
      params.require(:offering).permit(:name, :date, :format, :location, :price, :organization)
    end

end
