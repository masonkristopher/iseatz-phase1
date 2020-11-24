# require '../apis/zomato/client'

class Cuisine < ApplicationJob
  # get city info and cuisines in that city
  def self.by_city(city, key)
    # make requests to Zomato API
    zomato_client = Zomato::Client.new(key)
    cities_response = zomato_client.cities(city)
    city = cities_response['location_suggestions'][0]
    cuisines_response = zomato_client.cuisines(city['id'])

    # parse response data into response hash
    response = {}
    response['city_info'] = {
      :id => city['id'],
      :name => city['name'],
      :state => city['state_name'],
      :state_code => city['state_code'],
      :country => city['country_name'],
    }
    response['cuisines'] = cuisines_response['cuisines']
      .map{|item| item['cuisine']['cuisine_name']}
    response
  end
end
