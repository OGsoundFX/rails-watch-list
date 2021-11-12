class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, presence: true, length: { minimum: 6, message: "Comment is too short" }
  validates :movie_id, uniqueness: { scope: :list_id, message: "is already in the list" }
  # validates :list_id, uniqueness: { scope: :movie_id, message: "this list already contains this movie" }
end
