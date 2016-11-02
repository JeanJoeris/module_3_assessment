class BestBuyService
  def self.by_zipcode(search_params)
    zip = search_params[:zip]
    distance = search_params[:distance]
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{zip},#{distance})))?apiKey=#{ENV['best_buy_api_key']}&pageSize=15&format=json")
    JSON.parse(response.body, symbolize_names: true)
  end
end
