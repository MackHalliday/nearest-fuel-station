require 'rails_helper'

describe 'google api service' do
  it "google location data" do

    #https://maps.googleapis.com/maps/api/directions/json?origin=1331%2017th%20St%20CO%2080202&destination=650%2015th%20St%20CO%2080202&key=ENV['GOOGLE_API']

    service = GoogleApiService.new

    raw_data = service.get_direction_data("1331 17th St CO 80202", "650 15th St CO 80202")

    expect(service).to be_a(GoogleApiService)

    expect(raw_data).to be_a(Array)

    expect(raw_data[:routes]).to have_key(:distance)
    expect(raw_data[:routes]).to have_key(:steps)
    expect(raw_data[:routes][:steps]).to have_key(:html_instructions)
  end
end
