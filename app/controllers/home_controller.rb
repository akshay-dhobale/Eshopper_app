class HomeController < ApplicationController
  def index
    @banners = Banner.all
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
      NewsletterMailer.subscribed_user(@newsletter_sub.email).deliver_now
    end
    redirect_to root_path
  end

  private
    def home_params
      params.require(:home).permit(:email)
    end
end
