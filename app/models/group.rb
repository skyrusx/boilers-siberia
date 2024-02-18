class Group < ApplicationRecord
  has_many :supports, dependent: :destroy
end
