# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'dotenv'

module Zomato
  # Make GET requests to Zomato API - get cuisines by city
  class Cuisines
    def self.by_city(city)

      conn = Faraday.new(url: 'https://developers.zomato.com/api/v2.1/cities') do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.response :json
      end

      response = conn.get do |req|
        req.params['q'] = city
        req.headers['Content-Type'] = 'application/json'
        req.headers['user-key'] = ENV['API_KEY']
      end

      puts response.body
      return response.body
    end
  end
end
