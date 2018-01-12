class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  # belongs_to :coupon
  belongs_to :payment_gateway
  has_many :order_details, dependent: :destroy
  has_many :coupons_useds, dependent: :destroy
  enum status:[:Ordered, :Shipped, :Delivered, :Cancelled]
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
