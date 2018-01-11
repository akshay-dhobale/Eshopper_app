class CheckoutsController < ApplicationController
    include CartsHelper


  def address_select
    @totaladdress = Address.where(user_id: current_user.id)
    
  end

  def payment_review
    @order_address = Address.find(params[:address_id])
    session[:address_id] = params[:address_id]
    @cart_user = Cart.where(user_id: current_user.id)
    @total = cost_user_cart()
  end

  def payment_option
    @pay_gate = PaymentGateway.all
  end

  def add_address
    
  end
end
