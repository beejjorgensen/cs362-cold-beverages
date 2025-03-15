require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    let(:chiller) { 
        double('chiller', 
        capacity: 100, 
        remaining_capacity: 50, 
        temperature: 40, 
        set_level: nil, 
        turn_on: nil, 
        turn_off: nil, 
        add: nil)
    }

    let (:freezer){
        double('freezer',
        capacity: 200,
        remaining_capacity: 100,
        temperature: -10,
        set_level: nil,
        turn_on: nil,
        turn_off: nil,
        add: nil)
    }

    let(:water_dispenser){
        double('water_dispenser')
    }

    let(:water_reservoir){
        double('water_reservoir',
        current_water_volume: 50)
    }

    let(:refrigerator){ 
        Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir) 
    }

    it 'has a chiller, freezer, water dispenser, and water reservoir' do 
        expect(refrigerator.chiller).to eq(chiller)
        expect(refrigerator.freezer).to eq(freezer)
        expect(refrigerator.water_dispenser).to eq(water_dispenser)
        expect(refrigerator.water_reservoir).to eq(water_reservoir)
    end 

    it 'can chill' do 
        item = double('item')
        expect(chiller).to receive(:add).with(item)
        refrigerator.chill(item)
    end

    it 'can freeze' do 
        item = double('item')
        expect(freezer).to receive(:add).with(item)
        refrigerator.freeze(item)
    end 

    it 'total capacity' do 
        expect(refrigerator.total_capacity).to eq(300)
    end

    it 'remaining capacity' do 
        expect(refrigerator.remaining_capacity).to eq(150)
    end 

    it 'can be plugged in' do 
        expect(chiller).to receive(:turn_on)
        expect(freezer).to receive(:turn_on)
        refrigerator.plug_in
        expect(refrigerator.instance_variable_get(:@power)).to eq(:on)
    end 

    it 'can be unplugged' do 
        expect(chiller).to receive(:turn_off)
        expect(freezer).to receive(:turn_off)
        refrigerator.unplug
        expect(refrigerator.instance_variable_get(:@power)).to eq(:off)
    end 

    it 'can set chiller level' do 
        expect(chiller).to receive(:set_level).with(5)
        refrigerator.set_chiller_level(5)
    end 

    it 'can set freezer level' do 
        expect(freezer).to receive(:set_level).with(5)
        refrigerator.set_freezer_level(5)
    end 






end
