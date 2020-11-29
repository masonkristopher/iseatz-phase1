# frozen_string_literal: true

# get list of cuisines by city
class Api::CuisinesController < ApplicationController
  def index
    api_key = request.headers['api-key']

    if !api_key && !params['city']
      return render :json => 'Missing city query and API key', :status => 400
    elsif !api_key
      return render :json => 'Missing API key', :status => 400
    elsif !params['city']
      return render :json => 'Missing city query', :status => 400
    end

    response = Cuisine.by_city(params['city'], api_key)

    if response == 404
      return render :json => "No match found for #{params['city']} in cities", :status => 404
    end
    render :json => response

  end
end
