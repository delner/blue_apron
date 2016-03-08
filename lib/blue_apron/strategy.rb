class BlueApron::Strategy
  def name
    "random"
  end
  def next_move(state)
    self.random_move
  end
  def random_move
    choices = BlueApron::Moves.all.keys
    random_choice = [*(Range.new(0,choices.length-1))].sample
    BlueApron::Moves.all[choices[random_choice]].new
  end
end