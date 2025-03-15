require_relative '../lib/chiller'
require_relative '../lib/item'

RSpec.describe Chiller do
  it "has a default capacity of 100 and room temp of 70" do
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it "starts with power off" do
    chiller = Chiller.new
    expect { chiller.turn_off }.not_to raise_error
  end

  it "can turn on and off" do
    chiller = Chiller.new
    chiller.turn_on
    chiller.turn_off
  end

  it "adds items to its contents" do
    chiller = Chiller.new
    item = Item.new("Milk", 2)
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(98)
  end

  it "calculates remaining_capacity" do
    chiller = Chiller.new(50) 
    item1 = Item.new("Juice", 5)
    item2 = Item.new("Soup", 10)
    chiller.add(item1)
    chiller.add(item2)
    expect(chiller.remaining_capacity).to eq(35)
  end

  it "sets temperature based on level" do
    chiller = Chiller.new
    chiller.set_level(3) 
    expect(chiller.temperature).to eq(55)
  end
end
