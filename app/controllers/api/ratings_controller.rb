module Api
  class RatingsController < ApplicationController
    # GET /api/v1/ratings
    def index
      q = Api::Ratings::Query.new(ratings, params.to_unsafe_hash)

      respond_with q.results
    end

    # GET /api/v1/ratings/:id
    def show
      rating = find_rating

      respond_with rating
    end

    # POST /api/v1/ratings
    def create
      rating = Ratings::Form::Upsert.create(rating_params)

      respond_with rating
    end

    # PATCH /api/v1/ratings/:id
    def update
      rating = Ratings::Form::Upsert.find(params[:id])
      rating.update(rating_params)

      respond_with rating
    end

    # DELETE /api/v1/ratings/:id
    def destroy
      rating = find_rating

      rating.destroy
      respond_with rating
    end

    private

    def ratings
      Rating.includes(:user, :book).all
    end

    def rating_params
      params.from_jsonapi
            .require(:rating)
            .permit(:score, :user_id, :book_id, :review)
    end

    def find_rating
      ratings.find(params[:id])
    end
  end
end