class BlueApron::Strategies::FavoriteStrategy < BlueApron::Strategy
  def name
    "favorite"
  end
  def next_move(state)
    if most_common_move = self.most_common_move(state)
      most_common_move.beaten_by.new
    else
      super
    end
  end
  def most_common_move(state)
    turns_by_player_move = state.turns.group_by { |t| t.player_move.class }
    if turns_by_player_move.count > 0
      most_common_move_class = turns_by_player_move.max_by { |move, turns| turns.length }.first.new
    else
      nil
    end
  end
end

# Register the strategy
BlueApron::Strategies.add("favorite", BlueApron::Strategies::FavoriteStrategy)