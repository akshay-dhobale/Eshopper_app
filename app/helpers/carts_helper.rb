module CartsHelper

  def cost_user_cart
    # @cart_items = Cart.all
    @cart_user = Cart.where(user_id: current_user.id)
    @count = @cart_user.count()
    # Cost of all items in session cart
    a=0

    @cart_user.each do |item|
      a = (item.product.price*item.quantity + a)
    end 
    @shipping_cost = 4
    @p = a
    # return @p
  end
  
  def cost_with_tax
    @p*0.1
  end

  def cost_session_cart
    b =  session.keys 
    @p = b.map(&:to_i)
    a = session.values 
    @p = Product.where(id: b)
    # Cost of all items in session cart
    a=0
    @p.each do |item|
      a = (item.price*session[item.id.to_s] + a)
    end 
    @shipping_cost = 4
    @s = a
  end
end
