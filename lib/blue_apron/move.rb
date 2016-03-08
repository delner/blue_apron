class BlueApron::Move
  # Class
  # Allow each move to define who it beats, and who it's beaten by
  # We could change this to allow multiple moves, or to define more
  # complex behavior. But this is suitable for now.
  def self.beats(move = nil)
    @optimal_move = move if !move.nil?
    @optimal_move
  end
  def self.beaten_by(move = nil)
    @counter_move = move if !move.nil?
    @counter_move
  end

  # Instances
  def beats
    self.class.beats.class <= String ? Object.const_get(self.class.beats) : self.class.beats
  end
  def beaten_by
    self.class.beaten_by.class <= String ? Object.const_get(self.class.beaten_by) : self.class.beaten_by
  end
  def vs(move)
    if self.beats && move.class <= self.beats
      true # Win
    elsif self.beaten_by && move.class <= self.beaten_by
      false # Loss
    elsif move.class <= self.class
      nil # Tie
    end
  end
end