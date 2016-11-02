class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV['best_buy_api_key']}&pageSize=15&format=json")
    @data = JSON.parse(response.body, symbolize_names: true)
  end

  private
    def search_params
      params.permit(:search)
    end
end
