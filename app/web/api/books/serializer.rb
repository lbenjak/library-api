# frozen_string_literal: true

module Api
  module Books
    class Serializer < Base::Serializer
      set_type :book
      attribute :title
      attribute :number_of_copies
      attribute :isbn
      attribute :pages
      attribute :created_at
      attribute :updated_at
      attribute :author
      attribute :average_rating

      attribute :genres
      attribute :ratings
    end
  end
end
