class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def new_session_path(scope)
    new_user_session_path
  end

  def cart_count
    if current_user.present?
      @count = Cart.where(user_id: current_user.id).count()
      return @count
    end
  end

  def cost
    @cart_items = Cart.all
    @cart_user = Cart.where(user_id: current_user.id)
    @count = @cart_user.count()

    # Cost of all items in session cart
    a=0
    @cart_user.each do |item|
      a = (item.product.price*item.quantity + a)
    end 
    @a = a
    @shipping_cost = 4
  end
end
