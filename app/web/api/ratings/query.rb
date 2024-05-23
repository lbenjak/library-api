# frozen_string_literal: true

module Api
  module Ratings
    class Query < Jsonapi::QueryBuilder::BaseQuery
      default_sort score: :desc

      sorts_by :score
      sorts_by :created_at

      filters_by :score
    end
  end
end
