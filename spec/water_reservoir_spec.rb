require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

    it 'has a capacity and a water' do 
        reservoir = WaterReservoir.new(20, 10)
        expect(reservoir.capacity).to eq(20)
        expect(reservoir.current_water_volume).to eq(10)
    end

    it 'is intially empty' do 
        reservoir = WaterReservoir.new
        expect(reservoir).to be_empty
    end 

    it 'is no longer empty if volume is more than 0' do 
        reservoir = WaterReservoir.new(10,5)
        expect(reservoir).to_not be_empty
    end 

    it 'can be drained' do
        reservoir = WaterReservoir.new(20, 10)
        reservoir.drain(5)
        expect(reservoir.current_water_volume).to eq(5)
    end 



end
