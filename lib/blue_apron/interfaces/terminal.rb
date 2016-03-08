module BlueApron::Interfaces
  class Terminal
    def print_intro(info = {})
      puts "You are playing against strategy '#{info[:strategy].name}'."
    end
    def print_turn(info = {})
      outcome_text = "You win" if info[:outcome] == :win
      outcome_text = "You lose" if info[:outcome] == :loss
      outcome_text = "We tie" if info[:outcome] == :tie
      puts "I chose '#{info[:turn].computer_move.class.move_name}'. #{outcome_text}!"
    end
    def print_record(info = {})
      puts "you won #{info[:record][:win]} times."
      puts "you lost #{info[:record][:loss]} times."
      puts "we tied #{info[:record][:tie]} times."
    end
    def prompt_move(info = {})
      puts "Type 'r', 'p', 's' or 'x'."
      print "> "
      STDIN.gets.chomp
    end
  end
end