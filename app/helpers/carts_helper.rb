module CartsHelper

  def cost_user_cart
    # @cart_items = Cart.all
    @cart_user = Cart.where(user_id: current_user.id)
    @count = @cart_user.count()
    @total=0

    @cart_user.each do |item|
      @total = (item.product.price*item.quantity + @total)
    end 
    if session[:coupon_id].present? && session[:coupon_id] != nil
      coupon_id = session[:coupon_id].to_i
      @coupon = Coupon.find(coupon_id)
    end
    @shipping_cost = 4
    @total
    # return @p
  end
  
  def cost_with_tax
    @p*0.1
  end
  
  def cost_session_cart
    keys = session.keys
    @keys = keys.map(&:to_i)
    @products = Product.where(id: @keys)
    @total = 0
    @products.each do |product|
      @total = @total + (product.price * session[product.id.to_i])
    end
     if session[:coupon_id].present? && session[:coupon_id] != nil
      coupon_id = session[:coupon_id].to_i
      @coupon = Coupon.find(coupon_id)
    end
    @total
  end
end
