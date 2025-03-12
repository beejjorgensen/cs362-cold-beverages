require_relative '../lib/water_reservoir'

class MyVessel
    attr_reader :volume
  
    def initialize
      @volume = 9
    end
end

describe 'A water reservoir' do

    it 'capacity and current_water_volume' do
        waterreservoir = WaterReservoir.new(10, 10)
        expect(waterreservoir.capacity).to eq(10)
        expect(waterreservoir.current_water_volume).to eq(10)
      end

      it 'is initially empty' do
        waterreservoir = WaterReservoir.new
        expect(waterreservoir).to be_empty
      end

      it 'can be filled' do 
        waterreservoir = WaterReservoir.new
        expect(waterreservoir.fill).to eq(10)
      end

      it 'can be drained' do
        waterreservoir = WaterReservoir.new(10, 10)
        vessel = MyVessel.new
        expect(waterreservoir.drain(vessel.volume)).to eq(1)
      end

end
