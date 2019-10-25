require 'rails_helper'


describe 'google api service' do
  it "google location data" do

    service = GoogleLocationApiService.new

    raw_data = service.get_location_data("something")

    expect(service).to be_a(GoogleLocationApiService)

    expect(raw_data).to be_a(Array)

    expect(raw_data[0]).to have_key(:id)
    expect(raw_data[0]).to have_key(:location)
  end
end
