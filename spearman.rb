class Spearman < UnitType
  def initialize
    @strength = 5
    @training_cost = 10
    @training_points = 3
    @transform_cost = 30
  end

  def transform unit
    unit.unit_type = Archer.new
  end

  def can_transform?
    true
  end
end
