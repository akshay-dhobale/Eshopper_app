class ReportsController < ApplicationController
  def sales_report
    @data = Order.group_by_day(:created_at).count
  end

  def customer_registered
    @data = User.group_by_month(:created_at).count
  end

  def coupons_used
    @data = CouponsUsed.group_by_day(:created_at).count
  end
end
