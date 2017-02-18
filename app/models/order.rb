class Order < ApplicationRecord
  belongs_to :food_item
  validates :name, :phone_number, :address, presence: true
  validates :quantity, presence: true, numericality: true

  def total_price_calc
    self.total_price = self.coupon_code == 'CODERSCHOOL' ? (self.food_item.price * self.quantity) / 2 :
                                                           (self.food_item.price * self.quantity)
    self.total_price += 20000
  end
end
