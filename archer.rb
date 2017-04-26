class Archer < UnitType
  def initialize
    @strength = 10
    @training_cost = 20
    @training_points = 7
    @transform_cost = 40
  end

  def transform unit
    unit.unit_type = Knigth.new
  end

  def can_transform?
    true
  end
end
