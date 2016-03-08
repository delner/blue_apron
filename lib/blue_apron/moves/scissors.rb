class BlueApron::Moves::Scissors < BlueApron::Move
  def self.move_name
    "s"
  end
  beats "BlueApron::Moves::Paper"
  beaten_by "BlueApron::Moves::Rock"
end
BlueApron::Moves.add(BlueApron::Moves::Scissors.move_name, BlueApron::Moves::Scissors)