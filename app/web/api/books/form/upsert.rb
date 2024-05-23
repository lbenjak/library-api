# frozen_string_literal: true

module Api
  module Books
    module Form
      class Upsert < ActiveType::Record[Book]
        validates :title, presence: true, length: { minimum: 2 }
        validates :number_of_copies, numericality: { only_integer: true, greater_than_or_equal_to: 2 }
        validate :isbn_format

        def isbn_format
          isbn_stripped = isbn.delete('-')

          unless [10, 13].include?(isbn_stripped.length)
            errors.add(:isbn, 'length must be either 10 or 13 digits')
            return
          end

          unless isbn_stripped.match?(/\A[\dX]+\z/)
            errors.add(:isbn, 'must contain only digits or "X" for the last character of a 10-digit ISBN')
            return
          end

          if isbn_stripped.length == 13
            unless isbn_stripped.start_with?('978') || isbn_stripped.start_with?('979')
              errors.add(:isbn, '13-digit ISBN must start with "978" or "979"')
            end
          end
        end
      end
    end
  end
end
