class SearchController < ApplicationController
  def index
    resp = Faraday.get("https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest.json") do |req|
      req.headers['X-Api-Key'] = ENV['DEV_NET_API_KEY']
      req.params['location'] = "#{params[:q]}"
      req.params['fuel_type'] = "ELEC,LPG"
      req.params['limit'] = "10"
    end
    body = JSON.parse(resp.body)
    stations_api = body['fuel_stations']
    @stations_list = []
    stations_api.each do |station|
      @stations_list.push(Station.new(station))
    end
  end
end
