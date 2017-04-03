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


  private
    def category_params
      params.require(:category).permit(:name)
    end

end
