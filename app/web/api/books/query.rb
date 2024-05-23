# frozen_string_literal: true

module Api
  module Books
    class Query < Jsonapi::QueryBuilder::BaseQuery
      default_sort title: :asc

      sorts_by :title
      sorts_by :created_at
      sorts_by :updated_at

      filters_by :title
      # filters_by :author_id, Filter::Author
      filters_by :query, Search::Query
    end
  end
end
