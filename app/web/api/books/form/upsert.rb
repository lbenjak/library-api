# frozen_string_literal: true

module Api
  module Books
    module Form
      class Upsert < ActiveType::Record[Book]
        validates :title, presence: true, length: { minimum: 2 }
        validates :number_of_copies, numericality: { only_integer: true, greater_than_or_equal_to: 2 }
      end
    end
  end
end
