require 'swagger_helper'

describe 'Cuisines' do

  path '/api/cuisines/?city={city}' do

    get 'City Info and Cuisines List' do
      tags 'Endpoint 1 - Cuisines'
      produces 'application/json'
      parameter name: 'api-key', in: :header, type: :string, required: true
      parameter name: :city, in: :path, type: :string, required: true

      response '200', 'City info and list of cuisines found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            state: { type: :string },
            state_code: { type: :string },
            country: { type: :string },
            total_cuisines: { type: :integer },
            cuisines: { type: :array,
              items: {
                properties: {
                  name: { type: :string },
                  id: { type: :integer }
                }
              }
            },
          }

        run_test!
      end

      response '404', 'No match found for city' do
        let(:city) { 'invalid' }
        run_test!
      end

    end
  end
end
