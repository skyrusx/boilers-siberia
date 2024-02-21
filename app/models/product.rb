class Product < ApplicationRecord
  has_one_attached :image
  has_many :order_items

  TYPES = %w[Товар Услуга]
end
