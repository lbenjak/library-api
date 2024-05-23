class Book < ApplicationRecord
  belongs_to :author
  has_many :ratings
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  validates :title, presence: true
  validates :number_of_copies, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :pages, presence: true
  validates :published_at, presence: true

  def average_rating
    ratings.average(:score)
  end

  def validate_isbn
    if isbn.length != 13
      errors.add(:isbn, 'must be 13 characters long')
    end
  end

  def full_title
    "#{title} by #{author.full_name}"
  end
end
