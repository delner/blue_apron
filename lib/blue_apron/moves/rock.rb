class BlueApron::Moves::Rock < BlueApron::Move
  def self.move_name
    "r"
  end
  beats "BlueApron::Moves::Scissors"
  beaten_by "BlueApron::Moves::Paper"
end
BlueApron::Moves.add(BlueApron::Moves::Rock.move_name, BlueApron::Moves::Rock)