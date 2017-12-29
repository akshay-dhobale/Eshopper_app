class OrdersController < ApplicationController
  # before_action :authenticate_user!

  include CartsHelper

  def index
    @orders = Order.where(user_id: current_user.id)
    @user_order_details = OrderDetail.where(order_id: @orders.ids)
  end

  def new
    @order = Order.new
  end

  def create
    # binding.pry
    if !params[:payment_option].present?
      redirect_to orders_step3_path 
    else
      @order = Order.new
      @order.user_id = current_user.id
      @order.payment_gateway_id = params[:payment_option].to_i
      @order.address_id = session[:address_id].to_i
      session[:address_id] = nil
      @total = cost_user_cart()
      if session[:coupon_id].present? && session[:coupon_id] != nil
        @order.coupon_id = session[:coupon_id].to_i
        session[:coupon_id] = nil
        # @coupon = Coupon.find(@order.coupon_id)
        # @total = @total-@total*(@coupon. percent_off/100)
      end
      # @total_tax = @total + @total*0.1
      if @total > 200
        @order.grand_total = @total
        @order.shipping_charges = 0
      else
        @order.grand_total = @total + 4
        @order.shipping_charges = 4
      end

      # @order = Order.create(orders_params)
      if @order.save
        @user_cart = Cart.where(user_id: current_user.id)
        @user_cart.each do |cart_item|
          @order_details = OrderDetail.create(order_id:@order.id, product_id:cart_item.product_id, quantity:cart_item.quantity, amount:cart_item.product.price*cart_item.quantity)
          @order_details.save
          cart_item.delete
        end
        OrderMailer.order_created(@order, @order.order_details).deliver_now
      end
        redirect_to order_path(id: @order.id)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_detail_products = OrderDetail.where(order_id: @order.id)
  end
  
  def details
    @order = Order.find(params[:id])
    if @order.coupon_id != nil
      @coupon_used = Coupon.find(@order.coupon_id)
    end
    @order_detail_products = OrderDetail.where(order_id: @order.id)
  end

  private
  def orders_params
    params.require(:orders).permit(:user_id, :address_id, :coupon_id,:payment_gateway_id, :payment_option)
  end
end
