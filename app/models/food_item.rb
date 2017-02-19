class FoodItem < ApplicationRecord
  belongs_to :section
  validates :name, :price, presence: true
  has_many :orders
  has_many :reviews
  is_impressionable

  def self.search(search)
    where("name ILIKE ?", "#{search}")
  end

  def image_url_or_default
    image_url.presence || "http://loremflickr.com/480/480/#{name.strip}"
  end
end
