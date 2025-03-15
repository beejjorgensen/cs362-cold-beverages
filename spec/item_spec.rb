require_relative '../lib/item'

RSpec.describe Item do
  it "has a name and volume" do
    item = Item.new("Leftover Pizza", 5)
    expect(item.name).to eq("Leftover Pizza")
    expect(item.volume).to eq(5)
  end
end
