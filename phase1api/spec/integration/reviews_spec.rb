require 'swagger_helper'

describe 'Reviews' do

  path '/api/reviews/?city_id={city_id}&cuisine_id={cuisine_id}' do

    get 'Top 5 Restarants and Recent Reviews' do
      tags 'Endpoint 2 - Reviews'
      produces 'application/json'
      parameter name: 'api-key', in: :header, type: :string, required: true
      parameter name: :city_id, in: :path, type: :string, required: true
      parameter name: :cuisine_id, in: :path, type: :string, required: true

      response '200', 'Array of 5 restaurants\' info, including latest reviews found by city and cuisine input' do
        schema type: :array,
          items: {
            properties: {
              name: { type: :string },
              id: { type: :string },
              address: { type: :string },
              location: { type: :string },
              city_id: { type: :integer },
              reviews: { type: :array,
                items: {
                  properties: {
                    rating: { type: :integer },
                    review_text: { type: :string },
                    id: { type: :string },
                    rating_color: { type: :string },
                    review_time_friendly: { type: :string },
                    rating_text: { type: :string },
                    timestamp: { type: :string },
                    likes: { type: :integer },
                    user: { type: :object,
                      properties: {
                        name: { type: :string },
                        foodie_color: { type: :string },
                        profile_url: { type: :string },
                        profile_image: { type: :string },
                        profile_deeplink: { type: :string },
                      }
                    },
                    comments_count: { type: :integer },
                  }
                }
              },
            },
          }

        run_test!
      end

      response '404', 'No match found for city/cuisine' do
        let(:city_id) { 'invalid' }
        let(:cuisine_id) { 'invalid' }
        run_test!
      end

    end
  end
end
