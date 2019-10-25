class SearchFacade

  def initialize(location)
    @location = location.split(',')
  end

  def origin
    "#{street_parsed} #{state_parsed} #{zip_parsed}"
  end

  def street_parsed
    @location[0]
  end

  def state_parsed
    @location[2]
  end

  def zip_parsed
    @location[3]
  end

  def nearest_destination_name
    nearest_destination.station_name
  end

  def nearest_destination_fuel_type
    nearest_destination.station_name
  end

  def nearest_destination_access_days_time
    nearest_destination.access_days_time
  end

  def nearest_destination_address
    nearest_destination.address
  end

  def nearest_destination
    Destination.new(nrel_service[:fuel_stations][0])
  end

  def travel_time
    #did not have time to create object
    google_service[:routes][0][:legs][0][:duration][:text]
  end

  def distance
    #did not have time to create object
    google_service[:routes][0][:legs][0][:distance][:text]
  end

  def html_instructions
    #did not have time to create object
    google_service[:routes][0][:legs][0][:steps][0][:html_instructions]
  end

  def google_service
    GoogleApiService.new.get_direction_data(origin, nearest_destination_address)
  end

  def nrel_service
    NrelApiService.new.get_nearest_electic_station_data(street_parsed, state_parsed, zip_parsed)
  end
end
