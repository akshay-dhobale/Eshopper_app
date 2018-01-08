class ChargesController < ApplicationController
  include ChargesHelper
  include CartsHelper

  def new
  end

  def create
    @order = Order.new
    @order.user_id = current_user.id
    @order.payment_gateway_id = 2
    @order.address_id = session[:address_id].to_i
    session[:address_id] = nil
    @total = cost_user_cart()

    if session[:coupon_id].present? && session[:coupon_id] != nil
      @order.coupon_id = session[:coupon_id].to_i
      session[:coupon_id] = nil
      @coupon = Coupon.find(@order.coupon_id)
      @total = @total-@total*(@coupon. percent_off/100)
    end
    @total = @total + @total*0.1

    if @total > 200
      @order.grand_total = @total 
      @order.shipping_charges = 0
    else
      @order.grand_total = @total + 4
      @order.shipping_charges = 4
    end
    @order.status = "Ordered"

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @order.grand_total.to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    
    if params[:stripeToken].present?
      @order.save
      if @order.coupon_id != nil
        @coupons_used = CouponsUsed.create(user_id: @order.user_id, order_id: @order.id, coupon_id: @order.coupon_id)
      end
      @user_cart = Cart.where(user_id: current_user.id)
      
      @user_cart.each do |cart_item|
        @order_details = OrderDetail.create(order_id:@order.id, product_id:cart_item.product_id, quantity:cart_item.quantity, amount:cart_item.product.price*cart_item.quantity)
        @order_details.save
        cart_item.delete
      end
      OrderMailer.order_created(@order, @order.order_details).deliver_now
    end
    redirect_to order_path(id: @order.id)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
