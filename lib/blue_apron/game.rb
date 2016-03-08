class BlueApron::Game
  def initialize(options = {})
    @interface = options[:interface]
    @strategy = options[:strategy]
    @state = BlueApron::State.new
  end
  # Accessor methods
  def strategy
    @strategy
  end
  def interface
    @interface
  end
  def state
    @state
  end

  def play
    interface.print_intro(strategy: strategy)

    # Possible moves are just a hint to what the player can do
    possible_moves = BlueApron::Moves.all.keys + ['x']
    play = true

    while(play) do
      self.state.current_turn = BlueApron::Turn.new

      # Get the player's move
      player_move = self.get_player_move(possible_moves)

      if(player_move)
        # Get the computer's move
        computer_move = self.get_computer_move

        # Calculate and apply outcome to state
        self.apply_outcome(player_move, computer_move)
      else
        # Player doesn't want to play anymore
        play = false
      end
    end
  end
  def get_player_move(possible_moves)
    input = interface.prompt_move(moves: possible_moves)
    if !input.nil? && input != 'x'
      self.state.current_turn.player_move = BlueApron::Moves.all[input].new
    else
      nil
    end
  end
  def get_computer_move
    self.state.current_turn.computer_move = self.strategy.next_move(self.state)
  end
  def apply_outcome(player_move, computer_move)
    outcome = player_move.vs(computer_move)
    if outcome == true
      outcome = :win
    elsif outcome == false
      outcome = :loss
    elsif outcome.nil?
      outcome = :tie
    end
    
    self.interface.print_turn(turn: self.state.current_turn, outcome: outcome)
    self.state.apply_turn(self.state.current_turn, outcome)
    self.interface.print_record(record: self.state.record)
  end
end