require 'rails_helper'

describe Station do
  describe 'as a model' do
    it 'has the proper attributes' do
      resp = File.read('./spec/single_station.json')

      station = Station.new(JSON.parse(resp)['fuel_stations'][0])

      expect(station.name).to eq('UDR')
      expect(station.address).to eq('800 Acoma St Denver, CO 80204')
      expect(station.fuel_types).to eq('ELEC')
      expect(station.distance).to eq(0.31422)
      expect(station.access_times).to eq('24 hours daily')
    end

    it 'has stations presorted by distance via the API' do

    end
  end
end
