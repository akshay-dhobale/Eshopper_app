class OrderMailer < ApplicationMailer

	default from: 'eshopper.demo.test@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_created.subject
  #
  def order_created(order, order_details)
 		@order= order
 		@user = @order.user
    if @order.coupon_id != nil
      @coupon_used = Coupon.find(@order.coupon_id)
    end
    @order_details = order_details
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Products Ordered from Eshopper')
  end

  def order_cancelled(order, order_details)
    @order= order
    @user = @order.user
    if @order.coupon_id != nil
      @coupon_used = Coupon.find(@order.coupon_id)
    end
    @order_details = order_details
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Order Cancelled')
  end
end
