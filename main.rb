# frozen_string_literal: true
require 'highline'
require_relative 'inventory'

def clear_terminal
  puts "\e[H\e[2J"
end

PLAYER_INVENTORY = Inventory.default
COMPUTER_INVENTORY = Inventory.default
player_score = 0
computer_score = 0
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
    COMPUTER_INVENTORY.remove weapon_2
    PLAYER_INVENTORY.add weapon_2
  when 2
    PLAYER_INVENTORY.remove weapon_1
    COMPUTER_INVENTORY.add weapon_1
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
    menu.choices *PLAYER_INVENTORY.list
  end
  if player_weapon == '*'
    player_weapon = rps.sample
  end
  cli.say 'You chose...'
  cli.say player_weapon
  computer_weapon = COMPUTER_INVENTORY.list.sample # totally random!
  cli.say 'Computer chose...'
  cli.say computer_weapon
  result = who_wins(player_weapon, computer_weapon)
  cli.say result
  case result
  when 'tie'
    player_score = player_score +1
    computer_score = computer_score +1
    cli.say "It's a tie!!"
  when 1
    player_score = player_score +1
    cli.say 'You Win!!!!'
  when 2
    computer_score = computer_score + 1
    cli.say 'YOU LOSE!!!!!'
    cli.say 'Computer: "Mwahhahaahah! I win again, Sucker!"'
  end
  cli.say "" "
  ...............................
  |         SCORE               |
  | Computer:\t #{computer_score}\t\t|
  | You:\t #{player_score}\t\t|
  ```````````````````````````````
" ""
  if PLAYER_INVENTORY.empty?
    cli.say "Game Over!!"
    break
  end
  if COMPUTER_INVENTORY.empty?
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