require_relative '../lib/water_dispenser'

class MyVessel
    attr_reader :volume
  
    def initialize
      @volume = 10
      @is_full = false
    end

    def fill
      @is_full = true
    end
end

class MyReservoir
    attr_reader :capacity
    attr_accessor :current_water_volume
  
    def initialize(capacity = 10, initial_water_volume = 0)
      @capacity = capacity
      @current_water_volume = initial_water_volume
    end
  
    def empty?
      current_water_volume == 0
    end
  
    def fill
      current_water_volume = capacity
    end
     
    def drain(volume)
        self.current_water_volume -= volume
      end
end
describe 'A water dispenser' do

    it 'has a reservoir' do
        water = MyReservoir.new(10, 10)
        waterdispenser = WaterDispenser.new(water)
        expect(waterdispenser.reservoir).to eq(water)
      end
    it 'can be dispense' do
        water = MyReservoir.new(10, 10)
        waterdispenser = WaterDispenser.new(water)
        vessel = MyVessel.new
        expect(waterdispenser.dispense(vessel)).to eq(1)
    end
end
