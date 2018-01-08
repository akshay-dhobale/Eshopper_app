module ChargesHelper
	include CartsHelper
	def total_cost
    @total = cost_user_cart()

    if session[:coupon_id].present? && session[:coupon_id] != nil
      coupon_id = session[:coupon_id]
      @coupon = Coupon.find(coupon_id)
      @total = @total-@total*(@coupon. percent_off/100)
    end
    @total = @total + @total*0.1
    if @total > 200
      @grand_total = @total 
    else
      @grand_total = @total + 4
    end
    @grand_total
	end
end
