module Api
  class BooksController < ApplicationController
    # GET /api/v1/books
    def index
      q = Api::Books::Query.new(books, params.to_unsafe_hash)

      respond_with q.results
    end

    def show
      book = find_book

      respond_with book
    end

    # POST /api/v1/books
    def create
      book = Books::Form::Upsert.create(book_params)

      respond_with book
    end

    # PATCH /api/v1/books/:id
    def update
      book = Books::Form::Upsert.find(params[:id])
      book.update(book_params)

      respond_with book
    end

    # DELETE /api/v1/books/:id
    def destroy
      book = find_book

      book.destroy
      respond_with book
    end

    private

    def books
      Book.includes(:author, :genres, :ratings).all
    end

    def book_params
      params.from_jsonapi
            .require(:book)
            .permit(:title, :number_of_copies, :author_id, :isbn, :pages, :published_at, :genres)
    end

    def find_book
      books.find(params[:id])
    end
  end
end