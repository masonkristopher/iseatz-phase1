# frozen_string_literal: true

# Reviews Controller
module Api
  # Get top 5 restaurants' info and most revent 5 reviews
  class ReviewsController < ApplicationController
    def index
      api_key = request.headers['api-key']

      return render json: 'Missing city and cuisines IDs, and API key', status: 400 if !api_key && !params['city_id'] && !params['cuisine_id']
      return render json: 'Missing city and cuisine ID', status: 400 if !params['city_id'] && !params['cuisine_id']
      return render json: 'Missing cuisine ID', status: 400 if !params['cuisine_id']
      return render json: 'Missing city ID', status: 400 if !params['city_id']
      return render json: 'Missing API key', status: 400 if !api_key

      response = Review.by_city_and_cuisine(params['city_id'], params['cuisine_id'], api_key)

      return render json: 'No match found for city and cuisine search', status: 404 if response == 404

      render json: response
    end
  end
end
