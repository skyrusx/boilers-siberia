class Review < ApplicationRecord
  has_one_attached :avatar do |attachable|
    attachable.variant :preview, resize_to_limit: [112, 112]
    attachable.variant :admin, resize_to_limit: [75, 75]
  end
end
