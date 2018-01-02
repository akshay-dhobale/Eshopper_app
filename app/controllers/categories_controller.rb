class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @brands = Brand.all
    @category = Category.find(params[:id])
    @products = @category.products
    respond_to do |format|
      format.html{render :index}
      format.js 
    end
  end

  def show

    # @categories = Category.all
    @cat = Category.find(params[:id])
    @cat_products = @cat.products
    # binding.pry 
    respond_to do |format|
      format.js 
      # {render 'show_prod'}
    end
    # @productimages = ProductImage.all
   
  end


  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
