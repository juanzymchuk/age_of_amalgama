class CivilizationType
  attr_reader :units

  def initialize
    raise 'subclass responsibility'
  end

  def create_army
    army = Army.new
    @units.each do |unit_type, unit_count|
      unit_count.times { army.units << Kernel.const_get(unit_type.capitalize) }
    end
    army
  end
end
