class BrandcategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:category_id])
  	@brand = Brand.find(params[:brand_id])
  	# @product = @brand.products.where(category_ids: @category.id && brand_ids: @brand_id)
  	# @brand_cat_ids = @brand.products.map(&:category_ids)
  	# @product = @brand.products.where(category_ids: @category.id)
  	@products = @category.products.where(brand_id: @brand.id)
  	respond_to do |format|
      format.js
    end
  	# binding.pry
   end

  private
  def brandcategory_params
    params.require(:brandcategory).permit(:brand_id, :category_id)
  end
end
