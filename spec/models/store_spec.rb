require 'rails_helper'

describe 'Store' do
  it 'single store has long name, distance, phone number, city, store type' do
    store = Store.new(
      longName: "A long name",
      city: "A city",
      distance: "123",
      phone: "123-456-7890",
      storeType: "Awesome",
      storeId: "2740"
    )

    expect(store.long_name).to eq("A long name")
    expect(store.city).to eq("A city")
    expect(store.distance).to eq("123")
    expect(store.phone).to eq("123-456-7890")
    expect(store.type).to eq("Awesome")
    expect(store.id).to eq("2740")
  end
end
