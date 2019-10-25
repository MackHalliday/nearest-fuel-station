
class NrelApiService

  def get_nearest_electic_station_data(street, state, zip)
    json_response = conn.get('v1.json?', api_key: ENV['NREL_API'],
                                        fuel_type: "ELEC",
                                        format: "JSON",
                                        distance: "100",
                                        street_address: street,
                                        state: state,
                                        zip: zip,
                                        limit: 5)
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://developer.nrel.gov/api/alt-fuel-stations/'
    )
  end
end
