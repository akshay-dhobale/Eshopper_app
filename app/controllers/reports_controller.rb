class ReportsController < ApplicationController
  
  def index
    @order_count = Order.group_by_day(:created_at).count
    @user_count = User.group_by_day(:created_at).count
    @coupon_count = CouponsUsed.group_by_day(:created_at).count
  end

  def sales_report
    @data = Order.group(:created_at).count
  end

  def customer_registered
    @data = User.group(:created_at).count
  end

  def coupons_used
    @data = CouponsUsed.group_by_day(:created_at).count
  end
end
