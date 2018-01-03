class BrandcategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:category_id])
  	@brand = Brand.find(params[:brand_id])
  	@products = @category.products.where(brand_id: @brand.id)
  
  	respond_to do |format|
      format.js
    end
  end

  private
    def brandcategory_params
      params.require(:brandcategory).permit(:brand_id, :category_id)
    end
end
