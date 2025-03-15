require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/item'
require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'

RSpec.describe Refrigerator do
  let(:chiller) { Chiller.new(50) }
  let(:freezer) { Freezer.new(30) }
  let(:reservoir) { WaterReservoir.new(10, 5) }
  let(:dispenser) { WaterDispenser.new(reservoir) }

  subject(:fridge) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it "aggregates chiller, freezer, and water dispenser" do
    expect(fridge.chiller).to eq(chiller)
    expect(fridge.freezer).to eq(freezer)
    expect(fridge.water_dispenser).to eq(dispenser)
    expect(fridge.water_reservoir).to eq(reservoir)
  end

  it "can chill an item" do
    item = Item.new("Butter", 2)
    fridge.chill(item)
    expect(chiller.remaining_capacity).to eq(48)
  end

  it "can freeze an item" do
    item = Item.new("Ice pack", 5)
    fridge.freeze(item)
    expect(freezer.remaining_capacity).to eq(25)
  end

  it "calculates total and remaining capacity" do
    expect(fridge.total_capacity).to eq(80)
    expect(fridge.remaining_capacity).to eq(80)
  end

  it "plugs in, turning on chiller and freezer" do
    fridge.plug_in
  end

  it "unplugs, turning off chiller and freezer" do
    fridge.unplug
  end

  it "sets chiller and freezer levels" do
    fridge.set_chiller_level(3)
    expect(chiller.temperature).to eq(70 - (3 * 5)) 

    fridge.set_freezer_level(4)
    expect(freezer.temperature).to eq(70 - (4 * 10)) 
  end

  it "has a #to_s that shows power, capacity, temps, and water" do
    expect(fridge.to_s).to include("Power:")
    expect(fridge.to_s).to include("Storage:")
    expect(fridge.to_s).to include("Chiller is")
    expect(fridge.to_s).to include("Freezer is")
    expect(fridge.to_s).to include("Reservoir has")
  end
end
