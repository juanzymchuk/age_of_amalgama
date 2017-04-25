class Civilization
  attr_accessor :civilization_type, :armies

  def initialize(attrs = {})
    @civilization_type =  Kernel.const_get(attrs[:civilization_type].capitalize).new
    create_army
  end

  private

  def create_army
    @armies << @civilization_type.create_army
  end
end
