class CategoriesController < ApplicationController

  def index
    @categories = Category.where(:parent_id => nil)
    @category = Category.new
  end

  def new
    @category = Category.new(:parent_id => params[:parent_id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_url
    else
      render :edit
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :parent_id)
    end

end
