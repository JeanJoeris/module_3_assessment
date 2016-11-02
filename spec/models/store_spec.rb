require 'rails_helper'

describe 'Store' do
  it 'single store has long name, distance, phone number, city, store type' do
    store_search = Store.new(
      longName: "A long name",
      city: "A city",
      distance: "123",
      phone: "123-456-7890",
      storeType: "Awesome"
    )

    expect(store_search.long_name).to eq("A long name")
    expect(store_search.city).to eq("A city")
    expect(store_search.distance).to eq("123")
    expect(store_search.phone).to eq("123-456-7890")
    expect(store_search.type).to eq("Awesome")
  end
end
