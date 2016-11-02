class StoreSearch
  attr_reader :total
  attr_reader :stores

  def initialize(data_params)
    @total = data_params[:total]
    @stores ||= create_stores(data_params[:stores])
  end

  def self.by_zipcode(search_params)
    data = BestBuyService.by_zipcode(search_params)
    StoreSearch.new({total: data[:total], stores: data[:stores]})
  end

  def create_stores(stores_data)
    stores_data.map do |raw_store|
      Store.new(raw_store)
    end
  end
end
