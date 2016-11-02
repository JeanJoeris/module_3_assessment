class BestBuyService
  def self.by_zipcode(search_params)
    zip = search_params[:zip]
    distance = search_params[:distance]
    response = request(type: "area", zip: zip, distance: distance)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.by_store_id(store_id)
    response = request(type: "store_id", store_id: store_id)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn
      conn = Faraday.new(url: "https://api.bestbuy.com")
    end

    def self.request(params)
      function = area_function(params[:zip], params[:distance]) if params[:type] == 'area'
      function = store_id_function(params[:store_id]) if params[:type] == 'store_id'
      conn.get do |req|
        req.url "/v1/stores#{function}"
        req.params['apiKey'] = ENV['best_buy_api_key']
        req.params['pageSize'] = 15
        req.params['format'] = 'json'
      end
    end

    def self.area_function(zip, distance)
      "((area(#{zip},#{distance})))"
    end

    def self.store_id_function(store_id)
      "((storeId=#{store_id}))"
    end
end
