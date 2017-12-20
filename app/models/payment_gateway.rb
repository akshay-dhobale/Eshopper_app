class PaymentGateway < ApplicationRecord
	has_many :orders
end
