require_relative '../lib/freezer'

describe 'A freezer' do

    it 'has a capacity and a temperature' do 
        freezer = Freezer.new(100)
        expect(freezer.capacity).to eq(100)
        expect(freezer.temperature).to eq(70)
    end 

    it 'is initally off' do
        freezer = Freezer.new
        expect(freezer.instance_variable_get(:@power)).to eq(:off)
    end 
    
    it 'can be turned on' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.instance_variable_get(:@power)).to eq(:on)
    end

    it 'can be turned off' do 
        freezer = Freezer.new
        freezer.turn_on
        freezer.turn_off
        expect(freezer.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can add items' do 
        freezer = Freezer.new
        item = double('item', volume: 10)
        freezer.add(item)
        expect(freezer.instance_variable_get(:@contents)).to include(item)
    end 

    it 'shows remaing capacity' do 
        freezer = Freezer.new(100)
        item1 = double('item1', volume: 30)
        item2 = double('item2', volume: 20)
        freezer.add(item1)
        freezer.add(item2)
        expect(freezer.remaining_capacity).to eq(50)
    end 

    it 'sets the temp' do 
        freezer = Freezer.new
        freezer.set_level(5)
        expect(freezer.temperature).to eq(20)
    end 
end 





