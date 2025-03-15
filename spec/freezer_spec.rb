require_relative '../lib/freezer'
require_relative '../lib/item'

RSpec.describe Freezer do
  it "has a default capacity of 100 and room temp of 70" do
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end

  it "starts powered off" do
    freezer = Freezer.new
    expect { freezer.turn_off }.not_to raise_error
  end

  it "can turn on and off" do
    freezer = Freezer.new
    freezer.turn_on
    freezer.turn_off
  end

  it "adds items and calculates remaining capacity" do
    freezer = Freezer.new(30) 
    item = Item.new("Ice Cream", 5)
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(25)
  end

  it "set_level changes the temperature by 10 degrees per level" do
    freezer = Freezer.new
    freezer.set_level(4)
    expect(freezer.temperature).to eq(30)
  end
end
