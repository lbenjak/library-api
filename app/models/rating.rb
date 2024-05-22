class Rating < ApplicationRecord
  belongs_to :user
  has_many :book_ratings
  has_many :books, through: :book_ratings

  validates :score, presence: true
end
