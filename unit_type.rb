class UnitType
  attr_accessor :strength, :training_cost, :training_points, :transform_cost

  def initialize
    raise 'subclass responsibility'
  end

  def train unit
    unit.training_points +=  @training_points
  end

  def transform unit
    raise 'subclass responsibility'
  end

  def can_transform?
    raise 'subclass responsibility'
  end
end
