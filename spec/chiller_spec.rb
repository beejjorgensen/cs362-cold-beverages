require_relative '../lib/chiller'

class MyItem
    attr_reader :volume
  
    def initialize
      @volume = 10
    end
  
  end
describe 'A chiller' do

    it 'capacity and temperature' do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
      end

      it 'can turn on' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.instance_variable_get(:@power)).to eq(:on)
      end
    
      it 'can turn off' do
        chiller = Chiller.new
        chiller.turn_off
        expect(chiller.instance_variable_get(:@power)).to eq(:off)
      end

      it 'can add' do
        chiller = Chiller.new
        chiller.add("taco")
        expect(chiller.instance_variable_get(:@contents)).to eq(["taco"])
      end

      it 'remaining capacity' do
        chiller = Chiller.new
        item = MyItem.new
        chiller.add(item)
        expect(chiller.remaining_capacity).to eq(90)
      end

      it 'can set temperature' do
        chiller = Chiller.new
        expect(chiller.set_level(1)).to eq(65)

      end

end
