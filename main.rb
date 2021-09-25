# frozen_string_literal: true
require 'highline'
WEAPONS = ['rock', 'paper', 'scissors', 'star']

def who_wins (weapon_1, weapon_2)
  'tie' if weapon_1 == weapon_2
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
else
  cli.say 'YOU LOSE!!!!!'
  cli.say 'Computer: "Mwahhahaahah! I win again, Sucker!"'
end