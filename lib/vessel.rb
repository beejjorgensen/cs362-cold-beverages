class Vessel
  attr_reader :name, :volume, :current_volume

  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @current_volume = 0
  end

  def empty?
    @current_volume.zero?
  end

  def fill(amount = nil)
    if amount.nil?
      @current_volume = @volume
    else
      needed = @volume - @current_volume
      actual_fill = [needed, amount].min
      @current_volume += actual_fill
    end
  end
end
