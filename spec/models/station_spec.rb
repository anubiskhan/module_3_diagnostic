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
      resp = File.read('./spec/api_return.json')

      # stations_list = []
      # JSON.parse(resp)['fuel_stations'].each do |s|
      #   stations_list.push(Station)
      # end
      list = JSON.parse(resp)['fuel_stations']

      expect(list[0]['distance']).to be < list[1]['distance']
      expect(list[1]['distance']).to be < list[2]['distance']
      expect(list[2]['distance']).to be < list[3]['distance']
      expect(list[3]['distance']).to be < list[4]['distance']
      expect(list[4]['distance']).to be < list[5]['distance']
      expect(list[5]['distance']).to be < list[6]['distance']
      expect(list[6]['distance']).to be < list[7]['distance']
      expect(list[7]['distance']).to be < list[8]['distance']
      expect(list[8]['distance']).to be < list[9]['distance']
    end
  end
end
