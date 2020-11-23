# frozen_string_literal: true

# get list of cuisines by city
class Api::CuisinesController < ApplicationController
  def index
    api_key = request.headers['api-key']

    if !api_key && !params['city']
      return render :json => 'Missing city and API key', :status => 400
    elsif !api_key
      return render :json => 'Missing API key', :status => 400
    elsif !params['city']
      return render :json => 'Missing city', :status => 400
    end

    @response = Cuisine.by_city(params['city'], api_key)
    render :json => @response


  end
end
