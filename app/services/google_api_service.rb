
class GoogleApiService

  def get_direction_data(origin, destination)
    json_response = conn.get('json?', key: ENV['GOOGLE_API'], origin: origin, destination: destination)
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/directions/'
    )
  end
end
