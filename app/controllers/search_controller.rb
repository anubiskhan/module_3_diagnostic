class SearchController < ApplicationController
  def index
    @elec = Faraday.get("https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest.json") do |req|
      req.headers['X-Api-Key'] = ENV['DEV_NET_API_KEY']
      req.params['location'] = "#{params[:q]}"
      req.params['fuel_type'] = "ELEC"
      req.params['limit'] = "10"
    end
    @lpg = Faraday.get("https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest.json") do |req|
      req.headers['X-Api-Key'] = ENV['DEV_NET_API_KEY']
      req.params['location'] = "#{params[:q]}"
      req.params['fuel_type'] = "LPG"
      req.params['limit'] = "10"
    end
    @body1 = JSON.parse(@elec.body)
    @body2 = JSON.parse(@resp.body)
    binding.pry
  end
end
