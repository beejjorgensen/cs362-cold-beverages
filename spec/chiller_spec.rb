require_relative '../lib/chiller'

describe 'A chiller' do

    it 'has a capacity and a temperature' do 
        chiller = Chiller.new(100)
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
    end 

    it 'is initally off' do
        chiller = Chiller.new
        expect(chiller.instance_variable_get(:@power)).to eq(:off)
    end 
    
    it 'can be turned on' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.instance_variable_get(:@power)).to eq(:on)
    end

    it 'can be turned off' do 
        chiller = Chiller.new
        chiller.turn_on
        chiller.turn_off
        expect(chiller.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can add items' do 
        chiller = Chiller.new
        item = double('item', volume: 10)
        chiller.add(item)
        expect(chiller.instance_variable_get(:@contents)).to include(item)
    end 

    it 'shows remaing capacity' do 
        chiller = Chiller.new(100)
        item1 = double('item1', volume: 30)
        item2 = double('item2', volume: 20)
        chiller.add(item1)
        chiller.add(item2)
        expect(chiller.remaining_capacity).to eq(50)
    end 

    it 'sets the temp' do 
        chiller = Chiller.new
        chiller.set_level(5)
        expect(chiller.temperature).to eq(45)
    end 

end
