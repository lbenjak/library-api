# frozen_string_literal: true

module Api
  module Authors
    module Form
      class Upsert < ActiveType::Record[Author]
        validate :author_already_exists

        def author_already_exists
          author = Author.find_by(first_name: first_name, last_name: last_name)
          return if author&.id == id
          if author.present?
            errors.add(:author, 'already exists')
          end
        end
      end
    end
  end
end
