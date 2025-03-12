require_relative '../lib/item'

describe 'An item of food or a beverage' do

    it 'has a name and volume' do
        item = Item.new('Cake', 100)
        expect(item.name).to eq('Cake')
        expect(item.volume).to eq(100)
      end

end
