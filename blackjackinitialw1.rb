# BlackJack Game from Command Line
# NPL Initial Draft
# Simple setup - does nothing yet

def calculate_total(cards)
end

# Start Game

puts "Welcome to BlackJack!"

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Deal Cards

playercards = []
dealercards = []

playercards << deck.pop
dealercards << deck.pop
playercards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
playertotal = calculate_total(playercards)

# Show Cards

puts "Dealer has #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}" 
puts "You have #{playercards[0]} and #{playercards[1]}, for a total of #{playertotal}"
puts ""
puts "What would you like to do? 1 to Hit or 2 to Stay"
puts ""
puts "End of Initial Run"
