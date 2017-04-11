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
    tags = params[:offering][:offerings_tag][:tag_id]
    tags = tags.reject {|t| t.empty? }
    if !tags.empty?
      tags.each do |id|
        @offering.tags << Tag.find(id)
      end
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

  def edit
    @offering = Offering.find(params[:id])
    @offerings_tags = @offering.offerings_tags.new
    @tags = Tag.all
  end

  def update
    @tags = Tag.all
    @offering = Offering.find(params[:id])
    @offerings_tags = @offering.offerings_tags.new
    @offering.update(offering_params)
    flash[:success] = "Successfully updated #{@offering.name}"
    redirect_to admin_offering_path(@offering)
  end

  def destroy
    @offering = Offering.find(params[:id])
    @offering.delete
    redirect_to admin_dashboard_path
    flash[:success] = "Successfully deleted #{@offering.name}."
  end

  private
    def offering_params
      params.require(:offering).permit(:name, :date, :format, :location, :description, :website, :payment_options, :length, :materials, :price, :organization, :avatar, :offerings_tag, tag_ids:[])
    end

end
