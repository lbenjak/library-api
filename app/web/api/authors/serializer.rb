# frozen_string_literal: true

module Api
  module Authors
    class Serializer < Base::Serializer
      set_type :author
      attribute :first_name
      attribute :last_name
    end
  end
end
