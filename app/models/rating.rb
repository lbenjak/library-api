class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :score, presence: true
  validates :review, length: { maximum: 500 }

  def title
    "Rating for #{book.title} by #{user.full_name}"
  end
end
