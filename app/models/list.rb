class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # has_many :potatoes, class_name: "Bookmark", dependent: :destroy
  has_many :movies, through: :bookmarks
  # has_many :bananas, through: :bookmarks, source: :movie
  belongs_to :user
  has_one_attached :photo
  
  validates :name, presence: true, uniqueness: true
  validates :user, presence: true
end
