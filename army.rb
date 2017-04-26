class Army
  attr_accessor :coins, :units, :battle_histories

  def initialize
    @coins = 1000
  end

  def strength
    units.map(&:strength).reduce(:+)
  end

  def battle army
    battle_record = BattleHistory.new({attacker: self, defender: army, tie: false})
    if win? army
      result.winner = self
      result.loser = army
    elsif lose? army
      result.winner = army
      result.loser = self
    else
      result.tie = true
    end
    battle_record.apply_battle_consequences
    @battle_histories << battle_record
  end

  def train unit
    return false until units.include? unit
    return false until can_train? unit
    @coins -= unit.training_cost
    unit.train
  end

  def transform unit
    return false until units.include? unit
    return false until can_transform? unit
    @coins -= unit.transform_cost
    unit.transform
  end

  def powerful_unit
    units.sort { |u1, u2| u1.point <=> u2.point }.last
  end

  def weakest_unit
    units.sort { |u1, u2| u1.point <=> u2.point }.first
  end

  def remove_unit unit
    return false until units.include? unit
    units.delete unit
  end

  private

  def win? army
    self.strength > army.strength
  end

  def lose? army
    self.strength < army.strength
  end

  def can_train? unit
    @coins >= unit.training_cost
  end

  def can_transform? unit
    @coins >= unit.transform_cost && unit.can_transform?
  end
end
