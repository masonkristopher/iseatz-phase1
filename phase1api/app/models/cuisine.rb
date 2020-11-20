class Cuisine < ApplicationJob
  # get city info and cuisines in that city
  def self.by_city(city, key)
    # make requests to Zomato API
    cities_response = Zomato::Cities.get_all(city, key)
    city = cities_response.body['location_suggestions'][0]
    cuisines_response = Zomato::Cuisines.get_all(city['id'], key)

    # parse response data into response hash
    response = {}
    response['city_info'] = {
      :id => city['id'],
      :name => city['name'],
      :state => city['state_name'],
      :state_code => city['state_code'],
      :country => city['country_name'],
    }
    response['cuisines'] = cuisines_response.body['cuisines']
      .map{|item| item['cuisine']['cuisine_name']}
    response
  end
end
