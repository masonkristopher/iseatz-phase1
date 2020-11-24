class Review < ApplicationJob
  # get top 3 restaurants in a city, by city id and cuisine
  # includes latest 5 reviews for each restaurant
  def self.by_city_and_cuisine(city_id, cuisine_id, key)
    zomato_client = Zomato::Client.new(key)
    search_response = zomato_client.search(city_id, cuisine_id)
    puts search_response
    if search_response['results_found'] == 0
      return {'code' => 400, 'status' => 'Bad Request', 'message' => 'Error in city or cuisine ID'}
  end

    # build response array with first 3 restaurants
    response = search_response['restaurants'].take(3).map do |x| {
      # extract restaurant info
      :name => x['restaurant']['name'],
      :id => x['restaurant']['id'],
      :address => x['restaurant']['location']['address'],
      :location => x['restaurant']['location']['locality_verbose'],
      :city_id => x['restaurant']['location']['city_id'],
    }
    end

    # get reviews for each restaurant
    response.each do |restaurant|
      reviews_response = zomato_client.reviews(restaurant['id'])
      reviews = []
      # extract reviews and add to reviews array
      reviews_response['user_reviews'].each do |review|
        reviews.push(review['review'])
      end
      restaurant['reviews'] = reviews
    end

    response
  end
end