class SearchController < ApplicationController
  def index
    byebug
    Faraday.get("https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest.json") do |req|
      req.params['X-Api-Key'] = ENV['DEV_NET_API_KEY']
      req.params['location'] = "#{params[:q]}"
    end
  end
end
