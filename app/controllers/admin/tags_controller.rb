class Admin::TagsController < ApplicationController

  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_dashboard_path(current_user)
      flash[:success] = "Created new tag #{@tag.name}"
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end

end
