class SearchController < ApplicationController
  def index
    @resp = Faraday.get("https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest.json") do |req|
      req.headers['X-Api-Key'] = ENV['DEV_NET_API_KEY']
      req.params['location'] = "#{params[:q]}"
      req.params['fuel_type'] = "ELEC,LPG"
      req.params['limit'] = "10"
    end
    @body = JSON.parse(@resp.body)
    @stations_api = @body['fuel_stations']
    @stations_list = []
    @stations_api.each do |station|
      @stations_list.push(Station.new(station))
    end
    # binding.pry
  end

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
end
