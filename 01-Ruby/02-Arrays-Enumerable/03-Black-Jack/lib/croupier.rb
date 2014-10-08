require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  "Your score is #{player_score}, bank is #{bank_score}!"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score == 21
    "Black Jack! You win."
  elsif player_score > 21
    "> 21 You lose!"
  elsif player_score > bank_score
    "You beat the bank! You win."
  else
    "The bank beats you! You lose"
  end
end


def play_game
  # TODO: make the user play from terminal in a while loop that will stop
  #       when the user will not be asking for  a new card
  player_score = 0
  bank_score = pick_bank_score
  answer = "y"
  while (player_score < 22) && ((answer == "y") || (answer == "yes"))
    puts "Card ? (type 'y' or 'yes' for a new card)"
    answer = gets.chomp
    if (answer == "y") || (answer == "yes")
      player_score = pick_player_card + player_score
      puts state_of_the_game(player_score, bank_score)
    else
      puts state_of_the_game(player_score, bank_score)
    end
  end
  puts end_game_message(player_score, bank_score)
end
