require 'rails_helper'

describe 'google api service' do
  it "google location data" do

    #https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=ENV['GOOGLE_API']

    service = GoogleApiService.new

    raw_data = service.get_location_data("Turing", "")

    expect(service).to be_a(GoogleApiService)

    expect(raw_data).to be_a(Array)

    expect(raw_data[0]).to have_key(:id)
    expect(raw_data[0]).to have_key(:location)
  end
end
