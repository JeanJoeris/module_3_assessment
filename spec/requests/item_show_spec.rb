require 'rails_helper'

describe 'Item API' do
  it "shows a single item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    response_item = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_item[:name]).to eq("Frozen Banana")
    expect(response_item[:description]).to eq("Bluth Original")
    expect(response_item[:image_url]).to eq("http://vignette1.wikia.nocookie.net/arresteddevelopment/images/c/cd/1x05_Charity_Drive_(16).png")
  end
end
