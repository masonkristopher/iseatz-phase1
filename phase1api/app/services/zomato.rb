# frozen_string_literal: true

module Zomato
  # API wrapper for Zomato API
  class Client

    API_ENDPOINT = 'https://developers.zomato.com/api/v2.1'

    attr_reader :user_key

    def initialize(user_key = nil)
      @user_key = user_key
    end

    def cities(city_string)
      request(
        http_method: :get,
        endpoint: 'cities',
        params: { 'q' => city_string }
      )
    end

    def cuisines(city_id)
      request(
        http_method: :get,
        endpoint: 'cuisines',
        params: { 'city_id' => city_id }
      )
    end

    def search(city_id, cuisines_id)
      request(
        http_method: :get,
        endpoint: 'search',
        params: {
          'cuisines' => cuisines_id,
          'entity_id' => city_id,
          'entity_type' => 'city'
        }
      )
    end

    def reviews(restaurant_id)
      request(
        http_method: :get,
        endpoint: 'reviews',
        params: { 'res_id' => restaurant_id }
      )
    end

    private

    def client
      @client ||= Faraday.new(API_ENDPOINT) do |client|
        client.adapter Faraday.default_adapter
        client.headers['user-key'] = user_key if user_key.present?
      end
    end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params)
      parsed_response = Oj.load(response.body)

      return parsed_response if response.status == 200
      return response
    end
  end
end
