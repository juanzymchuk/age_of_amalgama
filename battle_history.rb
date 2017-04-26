class BattleHistory
  attr_accessor :attacker, :defender, :winner, :tie

  def initialize(attrs = {})
    @attacker = attrs[:attacker]
    @defender = attrs[:defender]
    @tie = attrs[:tie]
    @winner = attrs[:winner]
    @loser = attrs[:loser]
  end

  def apply_battle_consequences
    if @tie
      @attacker.remove_unit @attacker.powerful_unit
      @defender.remove_unit @defender.weakest_unit
    else
      @winner.coins += 100
      2.times { @loser.remove_unit @loser.powerful_unit }
    end
  end
end
