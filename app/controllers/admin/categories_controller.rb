class Admin::CategoriesController < ApplicationController

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_dashboard_path(current_user)
      flash[:success] = "Created new category #{@category.name}"
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    flash[:success] = "Successfully updated #{@category.name}"
    redirect_to new_admin_category_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to new_admin_category_path
    flash[:success] = "Successfully deleted #{@category.name}."
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
