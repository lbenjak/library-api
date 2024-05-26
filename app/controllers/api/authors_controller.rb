module Api
  class AuthorsController < ApplicationController
    # GET /api/authors
    def index
      respond_with authors
    end

    def show
      author = find_author

      respond_with author
    end

    # POST /api/authors
    def create
      author = Authors::Form::Upsert.create(author_params)

      respond_with author
    end

    # PATCH /api/authors/:id
    def update
      author = Authors::Form::Upsert.find(params[:id])
      author.update(author_params)

      respond_with author
    end

    # DELETE /api/authors/:id
    def destroy
      author = find_author

      author.destroy
      respond_with author
    end

    private

    def authors
      Author.all
    end

    def author_params
      params.from_jsonapi
            .require(:author)
            .permit(:first_name, :last_name, :biography)
    end

    def find_author
      authors.find(params[:id])
    end
  end
end