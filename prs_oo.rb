#1. PRS game between 2 players
#2. Both players can pick between 'paper', 'rock' or 'scissors'
#3. Then it's compare whether it's a tie or p > r, r > s, and s > p

class Player
  attr_accessor :name, :choice

  def initialize(n)
    @name = n
  end

  def pick_hand
    begin
      puts "Which one would you choose? (p/r/s)"
      pick = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(pick)

    @choice = pick
  end

  def random_hand
    @choice = Game::CHOICES.keys.sample
  end

  def choosen_pick
    "#{name} choose #{Game::CHOICES[choice]}"
  end
end

class Game
  attr_reader :player, :computer

  CHOICES = { 'p' => 'paper', 'r' => 'rock', 's' => 'scissors' }

  def initialize
    @player = Player.new('Bob')
    @computer = Player.new('CompA123')
  end

  def play
    player_hand = player.pick_hand
    computer_hand = computer.random_hand

    puts player.choosen_pick
    puts computer.choosen_pick

    compare_hands(player_hand, computer_hand)
  end

  def compare_hands(hand, another_hand)
    if hand == another_hand
      display_tie_message
    elsif (hand == 'p' && another_hand == 'r') ||
          (hand == 'r' && another_hand == 's') ||
          (hand == 's' && another_hand == 'p')
      display_winning_message(player)
    else
      display_winning_message(computer)
    end
  end

  def display_tie_message
    puts "=> It's a tie!"
  end

  def display_winning_message(which_player)
    puts "=> #{which_player.name} have won!"
  end
end

Game.new.play
