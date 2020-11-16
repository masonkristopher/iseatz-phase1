class MenusController < ApplicationController
  def index
    api_key = request.headers['api-key']
    @response = Zomato::Menus.by_city_and_cuisine(params['city'], params['cuisine'], api_key) if params['city'] && params['cuisine']

    # send response hash in json
    render :json => @response
  end
end
