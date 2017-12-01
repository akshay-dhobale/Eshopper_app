class ProductsController < ApplicationController
    # @products = Product.all
  def show  
	@categories = Category.all
	@brands = Brand.all
    @product = Product.find(params[:id])
  	# binding.pry
    # respond_to do |format|
    #   format.js 
    # end

  end

  private
  def product_params
    params.require(:product).permit( :name, :sku, :short_description, :long_description, :status, :price)
  end

end
