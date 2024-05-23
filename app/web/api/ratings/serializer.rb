# frozen_string_literal: true

module Api
  module Ratings
    class Serializer < Base::Serializer
      set_type :rating
      attribute :score
      attribute :review
      attribute :user
      attribute :book
      attribute :title
    end
  end
end
