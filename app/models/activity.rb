class Activity < ApplicationRecord
  has_one_attached :icon do |attachable|
    attachable.variant :preview, resize_to_limit: [115, 115]
    attachable.variant :admin, resize_to_limit: [75, 75]
  end
end
