require_relative '../lib/freezer'

class MyItem
    attr_reader :volume
  
    def initialize
      @volume = 10
    end
  
  end

describe 'A freezer' do

    it 'capacity and temperature' do
        freezer = Freezer.new
        expect(freezer.capacity).to eq(100)
        expect(freezer.temperature).to eq(70)
      end

      it 'can turn on' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.instance_variable_get(:@power)).to eq(:on)
      end
    
      it 'can turn off' do
        freezer = Freezer.new
        freezer.turn_off
        expect(freezer.instance_variable_get(:@power)).to eq(:off)
      end

      it 'can add' do
        freezer = Freezer.new
        freezer.add("taco")
        expect(freezer.instance_variable_get(:@contents)).to eq(["taco"])
      end

      it 'remaining capacity' do
        freezer = Freezer.new
        item = MyItem.new
        freezer.add(item)
        expect(freezer.remaining_capacity).to eq(90)
      end

end
