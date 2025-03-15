require_relative '../lib/water_reservoir'

RSpec.describe WaterReservoir do
  it "initializes with a capacity and current water volume" do
    reservoir = WaterReservoir.new(10, 5)
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it "is empty if current water volume is 0" do
    reservoir = WaterReservoir.new(10, 0)
    expect(reservoir.empty?).to be true
  end

  it "fills to max capacity" do
    reservoir = WaterReservoir.new(10, 2)
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(10)
  end

  it "drains the given volume" do
    reservoir = WaterReservoir.new(10, 5)
    reservoir.drain(2)
    expect(reservoir.current_water_volume).to eq(3)
  end

  it "does not go below zero" do
    reservoir = WaterReservoir.new(10, 5)
    reservoir.drain(10) 
    expect(reservoir.current_water_volume).to eq(0)
  end
end
