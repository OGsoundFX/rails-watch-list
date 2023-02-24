class Review < ApplicationRecord
  belongs_to :list
  validates :rating, :comment, presence: true
end
