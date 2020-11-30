# frozen_string_literal: true

# Cuisines Controller
module Api
  # Get city info and list of cuisines
  class CuisinesController < ApplicationController
    def index
      api_key = request.headers['api-key']

      return render json: 'Missing API key', status: 401 unless api_key
      return render json: 'Missing city query', status: 400 unless params['city']

      response = Cuisine.by_city(params['city'], api_key)

      return render json: "No match found for '#{params['city']}' in cities", status: 404 if response == 404

      render json: response
    end
  end
end
