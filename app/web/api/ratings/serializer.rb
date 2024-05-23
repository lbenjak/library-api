# frozen_string_literal: true

module Api
  module Ratings
    class Serializer < Base::Serializer
      attribute :score
      attribute :review
      attribute :user
      attribute :book
    end
  end
end
