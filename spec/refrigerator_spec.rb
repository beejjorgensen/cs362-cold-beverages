require_relative '../lib/refrigerator'

describe 'A refrigerator' do

    it 'has a chiller, freezer, water_dispenser, water_dispenser' do
        vessel = Vessel.new('tray', 9)
        water_reservoir = WaterReservoir.new
        water = WaterDispenser.new(vessel)
        freezer = Freezer.new
        chiller = Chiller.new
        refrigerator = Refrigerator.new(chiller, freezer, water, water_reservoir)
        expect(refrigerator.water_reservoir).to eq(water_reservoir)
        expect(refrigerator.water_dispenser).to eq(water)
        expect(refrigerator.freezer).to eq(freezer)
        expect(refrigerator.chiller).to eq(chiller)  
    end

    it 'can chill' do
        vessel = Vessel.new('tray', 9)
        water_reservoir = WaterReservoir.new
        water = WaterDispenser.new(vessel)
        freezer = Freezer.new
        chiller = Chiller.new
        refrigerator = Refrigerator.new(chiller, freezer, water, water_reservoir)
        refrigerator.chill('fish')
        expect(refrigerator.chiller.instance_variable_get(:@contents)).to eq(['fish'])
    end

    it 'can freeze' do
        vessel = Vessel.new('tray', 9)
        water_reservoir = WaterReservoir.new
        water = WaterDispenser.new(vessel)
        freezer = Freezer.new
        chiller = Chiller.new
        refrigerator = Refrigerator.new(chiller, freezer, water, water_reservoir)
        refrigerator.freeze('fish')
        expect(refrigerator.freezer.instance_variable_get(:@contents)).to eq(['fish'])
    end
    
    it 'can be pluged in' do
        vessel = Vessel.new('tray', 9)
        water_reservoir = WaterReservoir.new
        water = WaterDispenser.new(vessel)
        freezer = Freezer.new
        chiller = Chiller.new
        refrigerator = Refrigerator.new(chiller, freezer, water, water_reservoir)
        refrigerator.plug_in
        expect(refrigerator.instance_variable_get(:@power)).to eq(:on)
        expect(refrigerator.chiller.instance_variable_get(:@power)).to eq(:on)
        expect(refrigerator.freezer.instance_variable_get(:@power)).to eq(:on)
    end

    it 'can be un-pluged' do
        vessel = Vessel.new('tray', 9)
        water_reservoir = WaterReservoir.new
        water = WaterDispenser.new(vessel)
        freezer = Freezer.new
        chiller = Chiller.new
        refrigerator = Refrigerator.new(chiller, freezer, water, water_reservoir)
        refrigerator.unplug
        expect(refrigerator.instance_variable_get(:@power)).to eq(:off)
        expect(refrigerator.chiller.instance_variable_get(:@power)).to eq(:off)
        expect(refrigerator.freezer.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can set chiller level' do
        vessel = Vessel.new('tray', 9)
        water_reservoir = WaterReservoir.new
        water = WaterDispenser.new(vessel)
        freezer = Freezer.new
        chiller = Chiller.new
        refrigerator = Refrigerator.new(chiller, freezer, water, water_reservoir)
        refrigerator.set_chiller_level(1)
        expect(refrigerator.chiller.instance_variable_get(:@temperature)).to eq(65)
    end

    it 'can set freezer level' do
        vessel = Vessel.new('tray', 9)
        water_reservoir = WaterReservoir.new
        water = WaterDispenser.new(vessel)
        freezer = Freezer.new
        chiller = Chiller.new
        refrigerator = Refrigerator.new(chiller, freezer, water, water_reservoir)
        refrigerator.set_freezer_level(1)
        expect(refrigerator.freezer.instance_variable_get(:@temperature)).to eq(60)
    end

    it 'to s' do
        vessel = Vessel.new('tray', 9)
        water_reservoir = WaterReservoir.new
        water = WaterDispenser.new(vessel)
        freezer = Freezer.new
        chiller = Chiller.new
        refrigerator = Refrigerator.new(chiller, freezer, water, water_reservoir)
        expected_output = <<~STATUS
                          Power: #{refrigerator.instance_variable_get(:@power)}
                          Storage: #{refrigerator.remaining_capacity} of #{refrigerator.total_capacity} available
                          Temps: Chiller is #{refrigerator.chiller.temperature}, Freezer is #{refrigerator.freezer.temperature}
                          Water: Reservoir has #{refrigerator.water_reservoir.current_water_volume} remaining.
                          STATUS
        expect(refrigerator.to_s).to eq(expected_output)
    end

end
