class Review < ApplicationJob
  # get top 3 restaurants in a city, by city id and cuisine
  # includes latest 5 reviews for each restaurant
  def self.by_city_and_cuisine(city_id, cuisine_id, key)

    search_response = Zomato::Search.by_city_and_cuisine(city_id, cuisine_id, key)

    # build response array with first 3 restaurants
    response = search_response.body['restaurants'].take(3).map do |x| {
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
      reviews_response = Zomato::Reviews.by_restaurant(restaurant['id'], key)
      reviews = []
      # extract reviews and add to reviews array
      reviews_response.body['user_reviews'].each do |review|
        reviews.push(review['review'])
      end
      restaurant['reviews'] = reviews
    end

    response
  end
end