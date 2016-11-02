require 'rails_helper'

describe 'Item API' do
  it "finds index of items as json" do
    create_list(:item, 4)

    get "/api/v1/items"

    response_items = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_items.count).to eq(4)
    expect(response_items.first[:name]).to eq("Frozen Banana")
  end
end
