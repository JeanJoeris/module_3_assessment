require 'rails_helper'

describe 'Item API' do
  it "deletes an item" do
    item = create(:item)
    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(Item.count).to eq(0)
    expect(response.status).to eq(204)
  end
end
