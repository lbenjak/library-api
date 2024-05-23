# frozen_string_literal: true

module Api
    module Books
      module Search
        class Query < Jsonapi::QueryBuilder::BaseFilter
          def results
            return collection if query.blank?

            collection.joins(:author)
                      .where("authors.first_name ILIKE :query OR authors.last_name ILIKE :query
                              OR CONCAT(authors.first_name, ' ', authors.last_name) ILIKE :query
                              OR title ILIKE :query",
                             query: "%#{Book.sanitize_sql_like(query)}%")
          end
        end
      end
    end
end
