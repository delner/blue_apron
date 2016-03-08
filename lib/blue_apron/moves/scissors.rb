class BlueApron::Moves::Scissors < BlueApron::Move
  beats "BlueApron::Moves::Paper"
  beaten_by "BlueApron::Moves::Rock"
end
BlueApron::Moves.add("s", BlueApron::Moves::Scissors)