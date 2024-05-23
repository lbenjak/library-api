# frozen_string_literal: true

module Api
  module Books
    class Serializer < Base::Serializer
      set_type :book
      attribute :title
      attribute :number_of_copies
      attribute :isbn
      attribute :pages
      attribute :published_at
      attribute :created_at
      attribute :updated_at

      has_many :genres
      has_many :ratings


      belongs_to :author
    end
  end
end
