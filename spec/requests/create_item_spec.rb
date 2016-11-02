require 'rails_helper'

describe 'Item API' do
  it "creates an item" do
    item_params = {
      name: "A cool thing",
      description: "You know you want it",
      image_url: "http://foo.com/a_cool_thing"
    }
    expect(Item.count).to eq(0)

    post "/api/v1/items", item_params

    response_item = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(Item.count).to eq(1)
    expect(response_item[:name]).to eq("A cool thing")
    expect(response_item[:description]).to eq("You know you want it")
    expect(response_item[:image_url]).to eq("http://foo.com/a_cool_thing")
  end
end
