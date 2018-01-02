class BrandsController < ApplicationController
  def show
    @brands = Brand.all
    @products = Product.all
    @brand = Brand.find(params[:id])
    @products = @brand.products
    respond_to do |format|
      format.js
    end
  end

  private
  def brand_params
    params.require(:category).permit(:name)
  end
end
