class CouponsUsed < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :coupon

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
