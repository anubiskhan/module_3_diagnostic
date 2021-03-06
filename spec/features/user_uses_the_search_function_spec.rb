require 'rails_helper'

describe 'User' do
  scenario 'visits root and searches a zip code' do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    fill_in 'q', with: '80203'
    # And I click "Locate"
    click_on 'Locate'
    # Then I should be on page "/search"
    expect(current_path).to eq('/search')
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content('Fuel Station', count: 10)
    # And the stations should be limited to Electric and Propane
    expect(page).to_not have_content('BD')
    expect(page).to_not have_content('CNG')
    expect(page).to_not have_content('E85')
    expect(page).to_not have_content('HY')
    expect(page).to_not have_content('LNG')
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    expect(page).to have_content('Name:', count: 10)
    expect(page).to have_content('Address:', count: 10)
    expect(page).to have_content('Fuel Types:', count: 10)
    expect(page).to have_content('Distance:', count: 10)
    expect(page).to have_content('Access Times:', count: 10)

  end
end
