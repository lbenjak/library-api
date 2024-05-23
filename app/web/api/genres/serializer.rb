# frozen_string_literal: true

module Api
  module Genres
    class Serializer < Base::Serializer
      set_type :genre
      attribute :name
    end
  end
end
