class BlueApron::State
  attr_accessor :current_turn
  def turns
    @turns ||= []
  end
  def record
    @record ||= {
      win: 0,
      loss: 0,
      tie: 0
    }
  end
  def apply_turn(turn, outcome)
    self.record[outcome.to_sym] += 1
    self.turns << turn
  end
end