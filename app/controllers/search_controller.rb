class SearchController < ApplicationController
  def index
    @resp = Faraday.get("https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest.json") do |req|
      req.headers['X-Api-Key'] = ENV['DEV_NET_API_KEY']
      req.params['location'] = "#{params[:q]}"
    end
    @body = JSON.parse(@resp.body)
  end
end
