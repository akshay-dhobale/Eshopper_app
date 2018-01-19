class ProductsController < ApplicationController
    # @products = Product.all

  def index
    @products = Product.order(:name)
    respond_to do |format|
      format.html
    end
  end
  def show  
    @categories = Category.all
    @brands = Brand.all
    @product = Product.find(params[:id])
    @br = @product.brand_id
    @product_rating = ProductRating.where(product_id:@product.id, user_id:current_user.id)
    @product_rating_all = ProductRating.where(product_id: @product.id )
    @cart = Cart.new
    @brand_prod = Product.where(brand_id: @br)

    if current_user.present?
      @cart_user = Cart.where(user_id: current_user.id)
      @count = @cart_user.count()
    end
  end

  private
  def product_params
    params.require(:product).permit( :name, :sku, :short_description, :long_description, :status, :price)
  end

end
