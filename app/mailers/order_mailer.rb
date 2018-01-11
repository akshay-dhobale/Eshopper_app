class OrderMailer < ApplicationMailer

	# default from: 'eshopper.demo.test@gmail.com'

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
    attachments.inline['logo.png'] = File.read('app/assets/images/home/logo.png')
    
    @order_details.each do |order_image|
      if File.exist?(order_image.product.product_images.first.prod_img.path)
        attachments[order_image.product.product_images.first.prod_img_file_name] = File.read(order_image.product.product_images.first.prod_img.path)
      end
    end
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
    attachments.inline['logo.png'] = File.read('app/assets/images/home/logo.png')
    @order_details.each do |order_image|
      if File.exist?(order_image.product.product_images.first.prod_img.path)
        attachments[order_image.product.product_images.first.prod_img_file_name] = File.read(order_image.product.product_images.first.prod_img.path)
      end
    end
    mail(to: @user.email, subject: 'Order Cancelled')
  end
end
