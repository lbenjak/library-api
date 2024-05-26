module Api
  class GenresController < ApplicationController
    # GET /api/genres
    def index
      respond_with genres
    end

    private

    def genres
      Genre.all
    end
  end
end