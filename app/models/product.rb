class Product < ApplicationRecord
  has_one_attached :image
  has_many :order_items

  TYPES = {product: "Товар", service: "Услуга"}
end
