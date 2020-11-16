# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'dotenv'

module Zomato
  # Make GET requests to Zomato API - get cuisines by city
  class Cuisines
    def self.by_city(city, key)
      puts "Getting list of cuisines in #{city}"

      # create new hash to store city info and list of cuisines
      response = {}

      # set Zomato API connection
      conn = Faraday.new(url: 'https://developers.zomato.com/api/v2.1/') do |conn|
        # use Faraday middleware to parse responses
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end

      # get city info
      cities_response = conn.get('cities') do |req|
        req.params['q'] = city
        req.headers['user-key'] = key
      end

      # parse city info
      city = cities_response.body['location_suggestions'][0]
      response['city_info'] = city
      city_id = city['id']

      # get cuisines by city
      cuisines_response = conn.get('cuisines') do |req|
        req.params['city_id'] = city_id
        req.headers['user-key'] = key
      end

      # add cuisines to response hash
      response['cuisines'] = cuisines_response.body['cuisines']

      # return response hash
      response
    end
  end

  # Make GET requests to Zomato API - get menus for cuisines by city
  class Menus
    def self.by_city_and_cuisine(city, cuisine, key)

      "Getting menus for first 3 #{cuisine} restaurants in #{city}"

      set Zomato API connection
       conn = Faraday.new(url: 'https://developers.zomato.com/api/v2.1/') do |conn|
        # use Faraday middleware to parse responses
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end

      # get cuisines by city
      cuisines_response = conn.get('cuisines') do |req|
        req.params['city_id'] = city_id
        req.headers['user-key'] = key
      end

      # find cuisine and save id

      # get entity (location) id
      cities_response = conn.get('cities') do |req|
        req.params['q'] = city
        req.headers['user-key'] = key
      end

      # get 3 restaurants

      # get menus

    end
  end
end
