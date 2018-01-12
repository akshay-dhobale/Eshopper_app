class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @brands = Brand.all
    @category = Category.find(params[:id])
    @products = @category.products
    render :index
  end

  def show
    @cat = Category.find(params[:id])
    @cat_products = @cat.products
    respond_to do |format|
      format.js
      # format.csv {render text: @cat.to_csv} 
    end
  end


  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
