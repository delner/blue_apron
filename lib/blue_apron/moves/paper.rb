class BlueApron::Moves::Paper < BlueApron::Move
  def self.move_name
    "p"
  end
  beats "BlueApron::Moves::Rock"
  beaten_by "BlueApron::Moves::Scissors"
end
BlueApron::Moves.add(BlueApron::Moves::Paper.move_name, BlueApron::Moves::Paper)