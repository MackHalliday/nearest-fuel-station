# We will be using:
#
# The NREL alternate fuel stations nearest station API: https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
# The Google Directions API: https://developers.google.com/maps/documentation/directions/start
# We will be searching for the nearest electric charging station to Turing.
#
# As a user
# When I visit "/"
# And I select "Turing" form the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
#
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Distance
# - Access Times
#
# I should also see:
# - the distance of the nearest station
# - the travel time from Turing to that fuel station (should be 0.1 miles)
# - The HTML direction instructions to get to that fuel station
#   "Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>"

require 'rails_helper'

describe "nearest fuel station" do
  it "can find nearest fuel station" do

    visit "/"

    select "Turing"

    click_on "Find Nearest Station"

    expect(current_path).to eq("/search")

    save_and_open_page
    #nearest electric station
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("Fuel Type")
    expect(page).to have_content("Distance")
    expect(page).to have_content("Access Times")
    expect(page).to have_content("Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>")


  end
end
