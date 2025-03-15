class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    needed = vessel.volume - vessel.current_volume
    actual_dispense = [needed, reservoir.current_water_volume].min

    reservoir.drain(actual_dispense)

    vessel.fill(actual_dispense)
  end
end
