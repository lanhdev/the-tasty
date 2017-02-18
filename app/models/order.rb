class Order < ApplicationRecord
  belongs_to :food_item
  validates :name, :phone_number, :address, presence: true
  validates :quantity, presence: true, numericality: true
  validates :coupon_code, uniqueness: true
end
