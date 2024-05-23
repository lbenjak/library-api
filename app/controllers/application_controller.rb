class ApplicationController < ActionController::API
  include InfinumJsonApiSetup::JsonApi::ErrorHandling
  include InfinumJsonApiSetup::JsonApi::ContentNegotiation

  self.responder = InfinumJsonApiSetup::JsonApi::Responder

  respond_to :json_api
end
