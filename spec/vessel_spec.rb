require_relative '../lib/vessel'

describe 'A vessel for holding liquid' do
  it 'has a name and volume' do
    vessel = Vessel.new
    expect(vessel.name).to eq('FAKE')
    expect(vessel.volume).to eq(100)
  end

  it 'is initially empty' do
    vessel = Vessel.new('FAKE', 100)
    expect(vessel).to be_empty
  end

  it 'is no longer empty when we fill it' do
    vessel = Vessel.new('FAKE', 100)
    vessel.fill
    expect(vessel).to_not be_empty
  end

  it 'can fill partially' do
    vessel = Vessel.new('FAKE', 10)
    vessel.fill(3)
    expect(vessel.current_volume).to eq(3)
    vessel.fill(5)
    expect(vessel.current_volume).to eq(8)
    vessel.fill(10) 
    expect(vessel.current_volume).to eq(10) 
  end
end
