class HomeController < ApplicationController
  before_action :new_email

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
    def new_email
      if user_signed_in? && current_user.email == "#{current_user.uid}@home.com"
        respond_to do |format|
          format.html {redirect_to user_enter_email_path(current_user.id), notice:"Must enter new email address"}
        end
      end
    end
end
