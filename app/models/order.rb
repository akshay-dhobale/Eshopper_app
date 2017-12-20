class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  # belongs_to :coupon
  belongs_to :payment_gateway
  has_many :order_details


  # before_create do
  #   @total_tax = @a + @a*0.1
  #   binding.pry
  #   if @total_tax > 200
  #     @order.grand_total = @total_tax
  #     @order.shipping_charges = 4
  #     binding.pry
  #   else
  #     @order.grand_total = @total_tax + 4
  #     @order.shipping_charges = 0
  #     binding.pry
  #   end
  # end
end
