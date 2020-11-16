# frozen_string_literal: true

# get list of cuisines by city
class CuisinesController < ApplicationController
  def index
    api_key = request.headers['api-key']
    @response = Zomato::Cuisines.by_city(params['city'], api_key) if params['city']

    # send response hash in json
    render :json => @response
  end
end
