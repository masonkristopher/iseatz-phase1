# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'dotenv'

module Zomato
  # Make GET requests to Zomato API - get cuisines by city
  class Cuisines
    def self.by_city(city, key)

      puts 'Finding list of cuisines for ' + city

      # create new hash to store city info and list of cuisines
      response = Hash.new

      # get locations from Zomato
      conn = Faraday.new(url: 'https://developers.zomato.com/api/v2.1/cities') do |faraday|
        faraday.response :json
      end

      cities_response = conn.get do |req|
        req.params['q'] = city
        req.headers['user-key'] = key
      end

      # parse city info
      city = cities_response.body['location_suggestions'][0]
      response['city_info'] = city
      city_id = city['id']

      # get cuisines by city from Zomato
      conn = Faraday.new(url: 'https://developers.zomato.com/api/v2.1/cuisines') do |faraday|
        faraday.response :json
      end

      cuisines_response = conn.get do |req|
        req.params['city_id'] = city_id
        req.headers['user-key'] = key
      end

      # add cuisines to response hash
      response['cuisines'] = cuisines_response.body['cuisines']

      # return response hash
      response
    end
  end
end
