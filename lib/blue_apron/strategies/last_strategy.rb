class BlueApron::Strategies::LastStrategy < BlueApron::Strategy
  def name
    "last"
  end
  def next_move(state)
    if last_turn = state.turns.last
      last_turn.player_move.beaten_by.new
    else
      super
    end
  end
end

# Register the strategy
BlueApron::Strategies.add("last", BlueApron::Strategies::LastStrategy)