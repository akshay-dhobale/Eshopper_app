class ReportsController < ApplicationController
  def sales_report
    @data = Order.group_by_day(:created_at).count
  end

  def customer_registered
    @data = User.group_by_month(:created_at).count
  end

  def coupons_used
    # @orders = Order.all
    # @coupon_in_orders = []
    # @orders.each do |order|
    #   if order.coupon_id != nil
    #     @coupon_in_orders << order
    #   end
    # end
    # binding.pry
    @data = CouponsUsed.group_by_day(:created_at).count
  end
end
