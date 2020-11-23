class Api::ReviewsController < ApplicationController
  def index
    api_key = request.headers['api-key']

    if !api_key && !params['city_id'] && params['cuisine_id']
      return render :json => 'Missing city ID, cuisine ID, and API key', :status => 400
    elsif !api_key
      return render :json => 'Missing API key', :status => 400
    elsif !params['city_id']
      return render :json => 'Missing city ID', :status => 400
    elsif !params['cuisine_id']
      return render :json => 'Missing cuisine ID', :status => 400
    end

    @response = Review.by_city_and_cuisine(params['city_id'], params['cuisine_id'], api_key)
    render :json => @response
  end
end
