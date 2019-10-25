require 'rails_helper'


describe 'NREL api service' do
  it "NREL location data" do

    #https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=ELEC&api_key=ENV['NREL_API']&format=JSON&distance=5&street_address=1331%2017th%20St&state=CO&zip=80202

    service = NrelApiService.new

    raw_data = service.get_nearest_electic_station_data("1331 17th St", "CO", "80202")

    expect(service).to be_a(NrelApiService)

    expect(raw_data).to be_a(Hash)

    expect(raw_data[:fuel_stations][0]).to have_key(:station_name)
    expect(raw_data[:fuel_stations][0]).to have_key(:fuel_type_code)
    expect(raw_data[:fuel_stations][0]).to have_key(:street_address)
    expect(raw_data[:fuel_stations][0]).to have_key(:city)
    expect(raw_data[:fuel_stations][0]).to have_key(:zip)
    expect(raw_data[:fuel_stations][0]).to have_key(:access_days_time)
  end
end
