# frozen_string_literal: true
require 'highline'
require_relative 'inventory'
require_relative 'player'
require_relative 'computer'

def clear_terminal
  puts "\e[H\e[2J"
end

PLAYER = Player.new
COMPUTER = Computer.new
rps = ['rock', 'paper', 'scissors'].freeze
WEAPONS = ['rock', 'paper', 'scissors', '*'].freeze
MATCHUPS = {
  'rock' => {
    'rock' => 'tie',
    'paper' => 2,
    'scissors' => 1,
  },
  'paper' => {
    'rock' => 1,
    'paper' => 'tie',
    'scissors' => 2,
  },
  'scissors' => {
    'rock' => 2,
    'paper' => 1,
    'scissors' => 'tie',
  }
}.freeze

def who_wins(weapon_1, weapon_2)
  winner = MATCHUPS[weapon_1][weapon_2]
  case winner
  when 1
    COMPUTER.comp_inventory.remove weapon_2
    PLAYER.your_inventory.add weapon_2
  when 2
    PLAYER.your_inventory.remove weapon_1
    COMPUTER.comp_inventory.add weapon_1
  end
  winner
end

REPLAY = ['yes', 'no']
cli = HighLine.new
cli.say 'Welcome to.....'
cli.say 'ROCK, PAPER, SCISSORS, STAR!'

loop do
  player_weapon = cli.choose do |menu|
    menu.prompt = 'Choose Your Weapon'
    PLAYER.your_inventory.print_choices(menu)
  end
  if player_weapon == '*'
    player_weapon = rps.sample
  end
  cli.say 'You chose...'
  cli.say player_weapon
  computer_weapon = COMPUTER.comp_inventory.list.sample # totally random!
  cli.say 'Computer chose...'
  cli.say computer_weapon
  result = who_wins(player_weapon, computer_weapon)
  cli.say result
  case result
  when 'tie'
    PLAYER.increase_score
    COMPUTER.increase_score
    cli.say "It's a tie!!"
  when 1
    PLAYER.increase_score
    cli.say 'You Win!!!!'
  when 2
    COMPUTER.increase_score
    cli.say 'YOU LOSE!!!!!'
    cli.say 'Computer: "Mwahhahaahah! I win again, Sucker!"'
  end
  cli.say "" "
  ...............................
  |         SCORE               |
  | Computer:\t #{COMPUTER.score}\t\t|
  | You:\t #{PLAYER.score}\t\t|
  ```````````````````````````````
" ""
  if PLAYER.your_inventory.empty?
    cli.say "Game Over!!"
    break
  end
  if COMPUTER.comp_inventory.empty?
    cli.say "You're the RPSStar MASTER!!!!!"
    break
  end
  replay_choice = cli.choose do |menu|
    menu.prompt = 'Do you want to play again?'
    menu.choices *REPLAY
  end
  break if replay_choice == 'no'
  cli.terminal
  clear_terminal
  if replay_choice == 'yes'
    cli.say 'Yay!'
    cli.say '😄'
  end
end