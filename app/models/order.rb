class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  # belongs_to :coupon
  belongs_to :payment_gateway
  has_many :order_details, dependent: :destroy


  # after_save :add_to_order_details
  #
  # def add_to_order_details
  #   binding.pry
  # #   @user_cart = Cart.where(user_id: current_user.id)
  # #   @user_cart.each do |cart_item|
  # #     @order_details = OrderDetail.create(order_id:@order.id, product_id:cart_item.product_id, quantity:cart_item.quantity)
  # #     @order_details.save
  # #     cart_item.delete
  #   # end
    
  # end
end
