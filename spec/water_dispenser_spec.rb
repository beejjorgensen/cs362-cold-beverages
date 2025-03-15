require_relative '../lib/water_dispenser'
require_relative '../lib/vessel'
require_relative '../lib/water_reservoir'

RSpec.describe WaterDispenser do
  it "drains the reservoir by the vessel volume" do
    reservoir = WaterReservoir.new(10, 10)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 5)

    dispenser.dispense(vessel)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it "fills the vessel with whatever volume is dispensed" do
    reservoir = WaterReservoir.new(10, 10)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 5)

    dispenser.dispense(vessel)
    expect(vessel.current_volume).to eq(5)
  end

  it "only dispenses partial if reservoir doesn't have enough" do
    reservoir = WaterReservoir.new(10, 3)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 5)

    dispenser.dispense(vessel)
    expect(vessel.current_volume).to eq(3)  
    expect(reservoir.current_water_volume).to eq(0)
  end

  it "partially fills the vessel if it's not empty" do
    reservoir = WaterReservoir.new(10, 10)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 5)

    vessel.fill(2)  
    dispenser.dispense(vessel) 
    expect(vessel.current_volume).to eq(5)
    expect(reservoir.current_water_volume).to eq(7)
  end
end
