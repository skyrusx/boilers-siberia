class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def sub_total
    self.line_items.map { |item| item.total_price }.sum
  end
end
