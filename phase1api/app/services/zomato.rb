# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Zomato
  class API
    def self.connection
      Faraday.new(url: 'https://developers.zomato.com/api/v2.1/') do |conn|
        # use Faraday middleware to parse responses
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end
  end

  class Cities
    def self.get_all(city, key)
      conn = API.connection
      conn.get('cities') do |req|
        req.params['q'] = city
        req.headers['user-key'] = key
      end
    end
  end

  class Cuisines
    def self.get_all(city_id, key)
      conn = API.connection
      conn.get('cuisines') do |req|
        req.params['city_id'] = city_id
        req.headers['user-key'] = key
      end
    end
  end

  class Search
    def self.by_city_and_cuisine(city_id, cuisines_id, key)
      conn = API.connection
      conn.get('search') do |req|
        req.params['cuisines'] = cuisines_id
        req.params['entity_id'] = city_id
        req.params['entity_type'] = 'city'
        req.headers['user-key'] = key
      end
    end
  end

  class Reviews
    def self.by_restaurant(restaurant_id, key)
      conn = API.connection
      conn.get('reviews') do |req|
        req.params['res_id'] = restaurant_id
        req.headers['user-key'] = key
      end
    end
  end
end
