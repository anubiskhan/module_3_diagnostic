class Station
  def initialize(station_hash)
    @station_hash = station_hash
  end

  def name
    @station_hash['station_name']
  end

  def address
    "#{@station_hash['street_address']} #{@station_hash['city']}, #{@station_hash['state']} #{@station_hash['zip']}"
  end

  def fuel_types
    @station_hash['fuel_type_code']
  end

  def distance
    @station_hash['distance']
  end

  def access_times
    @station_hash['access_days_time']
  end
end
