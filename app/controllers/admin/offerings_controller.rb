class Admin::OfferingsController < ApplicationController

  def new
    @organization = Organization.find(params[:organization])
    @offering = @organization.offerings.new
    @offerings_tags = @offering.offerings_tags.new
    @tags = Tag.all
  end

  def create
    @organization = Organization.find(params[:organization])
    @offering = @organization.offerings.new(offering_params)
    tags = params[:offering][:offerings_tag]
    tags.values.each do |id|
      @offering.tags << Tag.find(id)
    end

    if @offering.save
      redirect_to admin_dashboard_path(current_user)
      flash[:success] = "Created new offering #{@offering.name}"
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end

  def show
    @offering = Offering.find(params[:id])
  end

  private
    def offering_params
      params.require(:offering).permit(:name, :date, :format, :location, :price, :organization, :offerings_tag, tag_ids:[])
    end

end
