module BlueApron::Interfaces
  # Allows it to play out a set of pre-programmed moves (ideal for testing)
  class Automatic
    def moves
      @moves ||= []
    end
    def moves=(m)
      @moves = m.reverse
    end
    def print_intro(info = {}); end
    def print_turn(info = {}); end
    def print_record(info = {}); end
    def prompt_move(info = {})
      self.moves.pop
    end
  end
end