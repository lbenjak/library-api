module Helpers
  module JsonApiHelpers
    def jsonapi_multi_relationship_body(resource_type, ids)
      {}.tap do |body|
        body[:data] = ids.map do |id|
          { type: resource_type, id: id.to_s }
        end
      end.to_json
    end

    def jsonapi_attrs_for(resource, options = {})
      {}.tap do |body|
        body[:data] = {}
        body[:data][:type] = options[:type] || resource.to_s.pluralize
        body[:data][:id] = options[:id]
        body[:data][:attributes] = attributes_for(resource, options.except(:id, :type))
      end.compact.to_json
    end

    def json_api_request_body(type, attributes, relationships = {}) # rubocop:disable Metrics/AbcSize
      {}.tap do |body|
        body[:data] = {}
        body[:data][:type] = type
        body[:data][:id] = attributes[:id] if attributes[:id].present?

        body[:data][:attributes] = attributes.except(:id)
        body[:data][:relationships] = relationships if relationships.present?
      end.to_json
    end

    def json_response
      JSON.parse(response.body)
    end

    def response_hash
      json_response.deep_symbolize_keys
    end

    def response_attributes
      response_hash.dig(:data, :attributes) || {}
    end

    def response_object
      OpenStruct.new(json_response['data']['attributes']) # rubocop:disable Style/OpenStructUse
    end

    def response_array
      json_response['data']
    end

    def default_headers
      {
        'accept' => 'application/vnd.api+json',
        'content-type' => 'application/vnd.api+json'
      }
    end
  end
end
