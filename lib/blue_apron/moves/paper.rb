class BlueApron::Moves::Paper < BlueApron::Move
  beats "BlueApron::Moves::Rock"
  beaten_by "BlueApron::Moves::Scissors"
end
BlueApron::Moves.add("p", BlueApron::Moves::Paper)