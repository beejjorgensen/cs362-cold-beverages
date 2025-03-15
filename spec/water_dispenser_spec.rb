require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    let(:reservoir) { double('reservoir') } 
    let(:vessel) { double('vessel', volume: 100) } 
    let(:water_dispenser) { WaterDispenser.new(reservoir) }

    it 'has a reservoir' do
        expect(water_dispenser.reservoir).to eq(reservoir)
    end

    it 'can dispense water into a vessel' do
        expect(reservoir).to receive(:drain).with(vessel.volume)
        water_dispenser.dispense(vessel)
    end

end
