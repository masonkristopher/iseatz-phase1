class Api::ReviewsController < ApplicationController
  def index
    api_key = request.headers['api-key']

    if !api_key && !params['city_id'] && params['cuisine_id']
      return render :json => 'Missing city and cuisines IDs, and API key', :status => 400
    elsif !api_key
      return render :json => 'Missing API key', :status => 400
    elsif !params['city_id'] && !params['cuisine_id']
      return render :json => 'Missing city and cuisine ID', :status => 400
    elsif !params['city_id']
      return render :json => 'Missing city ID', :status => 400
    elsif !params['cuisine_id']
      return render :json => 'Missing cuisine ID', :status => 400
    end

    response = Review.by_city_and_cuisine(params['city_id'], params['cuisine_id'], api_key)

    if response == 404
      return render :json => "No match found for city and cuisine search", :status => 404
    end
    render :json => response
  end
end
