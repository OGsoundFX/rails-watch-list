class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews
  belongs_to :user
  has_one_attached :photo
  
  validates :name, presence: true, uniqueness: true
  validates :user, presence: true
end
