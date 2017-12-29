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
    else
    #   @cart_user = Cart.where(user_id: current_user.id)
    #   @count = @cart_user.count()
    end
  end

  def newsletter
    @newsletter_email = Newsletter.find_by(email: params[:email])
    if @newsletter_email.present?
    else
      @newsletter_sub = Newsletter.create(email: params[:email])
    end
    redirect_to root_path
  end

  private
    def home_params
      params.require(:home).permit(:email)
    end
end
