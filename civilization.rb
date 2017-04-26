class Civilization
  attr_accessor :civilization_type, :armies
  CIVILIZATION_TYPE = %w(england byzantium china).freeze

  def initialize(attrs = {})
    raise 'invalid argument!' until CIVILIZATION_TYPE.include? attrs[:civilization_type]
    @civilization_type =  Kernel.const_get(attrs[:civilization_type].capitalize).new
    create_army
  end

  private

  def create_army
    @armies << @civilization_type.create_army
  end
end
