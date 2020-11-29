class Cuisine
  # get info and list of cuisines by city
  def self.by_city(city, key)
    # make requests to Zomato API
    zomato_client = Zomato::Client.new(key)
    cities_response = zomato_client.cities(city)

    # check for no results from cities
    if cities_response['location_suggestions'].length < 1
      return 404
    end

    city = cities_response['location_suggestions'][0]
    cuisines_response = zomato_client.cuisines(city['id'])

    # parse response data into response hash
    response = {
      :id => city['id'],
      :name => city['name'],
      :state => city['state_name'],
      :state_code => city['state_code'],
      :country => city['country_name'],
    }

    # add cuisines to response hash
    if cuisines_response['cuisines'].length < 1
      response['cuisines'] = []
    else
      response['total_cuisines'] = cuisines_response['cuisines'].length
      response['cuisines'] = cuisines_response['cuisines']
        .map{|item| {
          :name => item['cuisine']['cuisine_name'],
          :id => item['cuisine']['cuisine_id']
          }}
    end

    response
  end
end
