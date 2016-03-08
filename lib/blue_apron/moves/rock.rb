class BlueApron::Moves::Rock < BlueApron::Move
  beats "BlueApron::Moves::Scissors"
  beaten_by "BlueApron::Moves::Paper"
end
BlueApron::Moves.add("r", BlueApron::Moves::Rock)