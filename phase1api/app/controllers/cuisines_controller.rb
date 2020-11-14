# frozen_string_literal: true

# Get list of cuisines by city
class CuisinesController < ApplicationController
  def index
    @response = Zomato::Cuisines.by_city(params['city']) if params['city']
  end
end
