class SubcategoriesController < ApplicationController
  def index
  end

  def show
    # binding.pry
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
    respond_to do |format|
      # format.html {redirect_to subcategories_show_path(id: params[:id]) }
      format.js 
    end
  end

  private
  def subcategory_params
    params.require(:subcategory).permit(:name)
  end
end
