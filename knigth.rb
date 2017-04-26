class Knigth < UnitType
  def initialize
    @strength = 20
    @training_cost = 30
    @training_points = 10
  end

  def transform unit
    raise 'this unit cannot transform'
  end

  def can_transform?
    false
  end
end
