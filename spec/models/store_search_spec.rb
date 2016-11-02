require 'rails_helper'

describe 'Store search' do
  it 'returns an array of store objects and has a total number of stores' do
    VCR.use_cassette("store search PORO") do
      store_search = StoreSearch.by_zipcode({zip: 80202, distance: 25})

      first_store = store_search.stores.first

      expect(store_search.total).to eq(17)
      expect(store_search.stores.count).to eq(15)
      expect(first_store.class).to eq(Store)
      expect(first_store.long_name).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
    end
  end
end
