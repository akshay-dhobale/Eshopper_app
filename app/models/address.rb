class Address < ApplicationRecord
	belongs_to :user
	has_many :orders

	enum status:[:active, :inactive]
end
