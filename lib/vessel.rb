class Vessel
  attr_reader :volume, :name, :is_full

  def initialize(name, volume)
    @name = name
    @volume = volume
    @is_full = false
  end

  def empty?
    !@is_full
  end

  
  def fill
    @is_full = true
  end
end
