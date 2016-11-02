require 'rails_helper'

describe 'Best Buy API' do
  it 'returns a list of stores by zipcode' do
    VCR.use_cassette('best buy service store search') do
      response_data = BestBuyService.by_zipcode({zip: 80202, distance: 25})
      response_stores = response_data[:stores]

      expect(response_data[:total]).to eq(17)
      expect(response_stores.first[:longName]).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
    end
  end
end
