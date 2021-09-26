# frozen_string_literal: true
require 'highline'
WEAPONS = ['rock', 'paper', 'scissors', 'star'].freeze
MATCHUPS = {
  'rock' => {
    'rock' => 'tie',
    'paper' => 2,
    'scissors' => 1,
    'star' => 2
  },
  'paper' => {
    'rock' => 1,
    'paper' => 'tie',
    'scissors' => 2,
    'star' => 2
  },
  'scissors' => {
    'rock' => 2,
    'paper' => 1,
    'scissors' => 'tie',
    'star' => 2
  },
  'star' => {
    'rock' => 1,
    'paper' => 1,
    'scissors' => 1,
    'star' => 'tie'
  }
}.freeze

def who_wins(weapon_1, weapon_2)
  MATCHUPS[weapon_1][weapon_2]
end

cli = HighLine.new
cli.say 'Welcome to.....'
cli.say 'ROCK, PAPER, SCISSORS, STAR!'
player_weapon = cli.choose do |menu|
  menu.prompt = 'Choose Your WEAPON'
  menu.choices *WEAPONS
end
cli.say 'You chose...'
cli.say player_weapon
computer_weapon = WEAPONS.sample # totally random!
cli.say 'Computer chose...'
cli.say computer_weapon
result = who_wins(player_weapon, computer_weapon)
cli.say result
if result == 'tie'
  cli.say "It's a tie!!"
elsif result == 1
  cli.say 'You Win!!!!'
elsif result == 2
  cli.say 'YOU LOSE!!!!!'
  cli.say 'Computer: "Mwahhahaahah! I win again, Sucker!"'
end