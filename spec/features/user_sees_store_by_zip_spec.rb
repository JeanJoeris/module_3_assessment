require 'rails_helper'

describe 'Best buy store index' do
  it 'user sees list of stores by zip' do
    # As a user
    # When I visit "/"
    # And I fill in a search box with "80202" and click "search"
    # Then my current path should be "/search" (ignoring params)
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    # And I should see exactly 15 results
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
    visit root_path

    fill_in "search", with: "80202"
    click_on "search"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_css(".store", count: 15)
    # within(".store:nth-child(1)") do
    #   expect(page).to have_content
    # end
  end
end
