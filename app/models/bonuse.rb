class Bonuse < ApplicationRecord
  has_one_attached :banner do |attachable|
    attachable.variant :preview, resize_to_limit: [408, 200]
    attachable.variant :admin, resize_to_limit: [153, 75]
  end
end
