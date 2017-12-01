class SubcategoriesController < ApplicationController
  def index
  end

  def show
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
    # binding.pry
    respond_to do |format|
      format.js 
    end
  end

  private
  def subcategory_params
    params.require(:subcategory).permit(:name)
  end
end
