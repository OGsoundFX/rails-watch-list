class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  include PgSearch::Model
  pg_search_scope :search_movies,
    against: [ :title, :overview, :release_date ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
