# frozen_string_literal: true

# Reviews Controller
module Api
  # Get top 5 restaurants' info and most recent 5 reviews
  class ReviewsController < ApplicationController
    def index
      api_key = request.headers['api-key']

      return render json: 'Missing API key', status: 401 unless api_key
      return render json: 'Missing city and/or cuisine ID', status: 400 if !params['city_id'] || !params['cuisine_id']

      response = Review.by_city_and_cuisine(params['city_id'], params['cuisine_id'], api_key)

      return render json: 'No match found for city and cuisine search', status: 404 if response == 404

      render json: response
    end
  end
end
