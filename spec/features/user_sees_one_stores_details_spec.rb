require 'rails_helper'

describe 'Individual store show' do
  it 'has the stores name, type, address, and hours' do
    # As a user
    # After I have searched a zip code for stores
    # When I click the name of a store
    # Then my current path should be "/stores/:store_id"
    # I should see the store name, store type and address with city, state and zip
    # I should see an unordered list of the store hours in the following format:
    #   * Mon: 10am-9pm
    #   * Tue: 10am-9pm
    #   * Wed: 10am-9pm
    #   * Thurs: 10am-9pm
    #   * Fri: 10am-9pm
    #   * Sat: 10am-9pm
    #   * Sun: 11am-7pm
    VCR.use_cassette("single store details") do
      visit root_path

      fill_in "search", with: "80202"
      click_on "search"

      click_on "Best Buy Mobile - Cherry Creek Shopping Center"

      expect(current_path).to eq("/stores/2740")
      expect(page).to have_content("Cherry Creek Shopping Center")
      expect(page).to have_content("Type: Mobile")
      expect(page).to have_content("Denver, CO 80206")
      within("ul") do
        expect(page).to have_content("Mon: 10am-9pm")
        expect(page).to have_content("Tue: 10am-9pm")
        expect(page).to have_content("Wed: 10am-9pm")
        expect(page).to have_content("Thurs: 10am-9pm")
        expect(page).to have_content("Fri: 10am-9pm")
        expect(page).to have_content("Sat: 10am-9pm")
        expect(page).to have_content("Sun: 11am-6pm")
      end
    end
  end
end
