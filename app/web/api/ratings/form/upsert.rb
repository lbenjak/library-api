# frozen_string_literal: true

module Api
  module Ratings
    module Form
      class Upsert < ActiveType::Record[Rating]
        validates :score, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
        validates :review, length: {minimum:5, maximum: 500 }
      end
    end
  end
end
