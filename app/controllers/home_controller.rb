class HomeController < ApplicationController
  def index
    @banner = Banner.all
    @categories = Category.all
    @brands = Brand.all
    @productcategories = ProductCategory.all
    @products = Product.all
    @productimages = ProductImage.all
    
    if current_user.present?
      @count = Cart.where(user_id: current_user.id).count()
    #   @cart_user = Cart.where(user_id: current_user.id)
    #   @count = @cart_user.count()
    end
  end
end
