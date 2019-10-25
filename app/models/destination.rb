class Destination
  attr_reader :station_name, :fuel_type, :access_days_time, :address

  def initialize(station)
    @station_name = station[:station_name]
    @fuel_type = station[:fuel_type_code]
    @access_days_time = station[:access_days_time]
    @address = "#{station[:street_address]}, #{station[:city]},  #{station[:state]} #{station[:zip]}"
  end
end
