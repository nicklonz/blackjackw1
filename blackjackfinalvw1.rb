# BlackJack Game from the Command Line
# By NPL Tealeaf Academy Week 1

def card_value(cards)
  # Format [['Heart', '3'],[Spade, '4']] 
  # The map method takes an enumerable object and a block, and runs the block for each element, replacing the value with the returned value from the block.
  array = cards.map { |a| a[1] }
  hand_total = 0
  array.each do |card|
    # Ace == 11 if total < 21
    if card == 'Ace'
      hand_total += 11
    elsif card.to_i == 0
      hand_total += 10
    else
      hand_total += card.to_i
    end
  end
    array.select{ |a| a == 'Ace' }.count.times do
    hand_total -= 10 if hand_total > 21
      end
  hand_total
end

# Play again option
def keep_playing
  puts 'Play again? Y or N?'
  play_again = gets.chomp.upcase

    if !['Y', 'N'].include?(play_again)
      puts 'Please enter Y or N'
    end

    if play_again == 'Y'
      puts 'OK. Here you go.'
      game_on = true
    else play_again == 'N'
      puts "Ok. Game Over. Have a good one."
      game_on = false
      exit
    end
end

puts ""
puts "Welcome to Ruby Command Line BlackJack!"
puts ""
puts "What's your name?"
user = gets.chomp.capitalize
puts ""
puts "Hello #{user}. I'm your dealer."  
puts "Just call me 'PC'."
puts "The rules are quite simple. I play with a single deck."
puts "I hit on 16 and lower and stay on 17:"
puts "There are no spilts, double down or betting for that matter."
puts "Afterall, I'm only a small string of code made by a Tealeaf Week 1 student."
puts ""

game_on = true
while game_on == true

  puts ""
  puts "I hope you're ready to play BlackJack #{user}."
  puts ""
  puts "Here we go:"
  puts ""
  sleep 1 #sleep(num_secs)

  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10",
            "Jack", "Queen", "King", "Ace"]

  deck = suits.product(cards)
  
  deck.shuffle!

  # Deal cards

  playercards = []
  dealercards = []

  playercards << deck.pop
  dealercards << deck.pop
  playercards << deck.pop
  dealercards << deck.pop

  # Count Cards

  playertotal = card_value(playercards)
  dealertotal = card_value(dealercards)

  puts "Your cards are a #{playercards[0][1]} of #{playercards[0][0]} "
  puts "and a #{playercards[1][1]} of #{playercards[1][0]}."
  puts ""
  puts "PC dealer shows a #{dealercards[1][1]} of #{dealercards[1][0]}."
  puts ""
  puts "You have a total of #{playertotal} now #{user}."

  if playertotal == 21
    puts "#{user} has BlackJack!"
    puts ""
    keep_playing
    next
  end

  # Player Hand

  playing = true

  if playertotal == 20
    puts ""
    puts "I would stay with a 20 #{user}!"
    puts ""
  end

  while playertotal <= 21 && playing == true
    puts ""
    puts "What would you like to do #{user}?"
    puts "1 to Hit or 2 to Stay"
    player_move = gets.chomp
      if player_move == '1'
        playercards << deck.pop
        playertotal = card_value(playercards)
        puts "PC dealer hands you a #{playercards[-1][1]} of #{playercards[-1][0]}."
        puts "Your new total is #{playertotal}"
      elsif player_move == '2'
        puts "#{user} is staying."
        playertotal = card_value(playercards)
        playing = false
      else
        puts "Please enter either 1 or 2."
      end
    end

  if playertotal > 21
    puts "Sorry #{user}, you busted!"
    puts ""
    keep_playing
    next
  end

  # Dealer Hand

  puts "PC dealer flips his card and shows a #{dealercards[0][1]} of #{dealercards[0][0]}."
  puts "PC dealer has a #{dealercards[0][1]} of #{dealercards[0][0]} " 
        "and a #{dealercards[1][1]} of #{dealercards[1][0]}"
  puts "PC dealer has a total of #{dealertotal}."

  while dealertotal <= playertotal && dealertotal < 17
    puts "PC dealer hits."
    dealercards << deck.pop
    sleep 1
    puts "PC dealer draws a #{dealercards[-1][1]} of #{dealercards[-1][0]}."
    dealertotal = card_value(dealercards)
    puts "PC dealer's new total is #{dealertotal}."
  end

  # Evaluate Hands

  if dealertotal > 21
    puts "PC Dealer busts #{user}! You win!"
    puts ""
  elsif dealertotal > playertotal
    puts "Sorry #{user}, PC dealer wins!"
    puts ""
  elsif dealertotal < playertotal
    puts "#{user} wins the hand!"
    puts ""
  else
    puts "It's a Tie!"
    puts ""
  end
  keep_playing
end