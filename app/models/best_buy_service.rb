class BestBuyService
  def self.by_zipcode(search_params)
    zip = search_params[:zip]
    distance = search_params[:distance]
    response = conn.get do |req|
      req.url "/v1/stores((area(#{zip},#{distance})))"
      req.params['apiKey'] = ENV['best_buy_api_key']
      req.params['pageSize'] = 15
      req.params['format'] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.by_store_id(store_id)
    response = conn.get do |req|
      req.url "/v1/stores((storeId=#{store_id}))"
      req.params['apiKey'] = ENV['best_buy_api_key']
      req.params['pageSize'] = 15
      req.params['format'] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn
      conn = Faraday.new(url: "https://api.bestbuy.com")
    end
end
