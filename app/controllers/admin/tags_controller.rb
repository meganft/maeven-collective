class Admin::TagsController < ApplicationController

  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_admin_tag_path
      flash[:success] = "Created new tag #{@tag.name}"
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    flash[:success] = "Successfully updated #{@tag.name}"
    redirect_to new_admin_tag_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to new_admin_tag_path
    flash[:success] = "Successfully deleted #{@tag.name}."
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end

end
