class Unit
  attr_accessor :unit_type, :training_points
  UNIT_TYPES = %w(spearman archer knigth).freeze

  def initialize(attrs = {})
    raise 'invalid argument!' until UNIT_TYPES.include? attrs[:unit_type]
    @unit_type ||= Kernel.const_get(attrs[:unit_type].capitalize).new
    @training_points ||= 0
  end

  def strength
    @unit_type.strength + @training_points
  end

  def train
    @unit_type.train(self)
  end

  def training_cost
    @unit_type.training_cost
  end

  def transform
    @unit_type.transform(self)
  end

  def can_transform?
    @unit_type.can_transform?
  end

  def transform_cost
    @unit_type.transform_cost
  end
end
