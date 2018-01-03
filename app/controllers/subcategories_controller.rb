class SubcategoriesController < ApplicationController
  def index
  end

  def show
    @categories = Category.all
    @brands = Brand.all
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
    respond_to do |format|
      format.js 
      format.html
    end
  end

  private
  def subcategory_params
    params.require(:subcategory).permit(:name)
  end
end
