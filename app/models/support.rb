class Support < ApplicationRecord
  belongs_to :group
  has_one_attached :file
end
