# frozen_string_literal: true
require 'highline'
cli = HighLine.new
WEAPONS = ['rock', 'paper', 'scissors', 'star']
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
print computer_weapon
print ' destroys '
cli.say player_weapon
cli.say 'YOU LOSE!!!!!'
cli.say 'Computer: "Mwahhahaahah! I win again, Sucker!"'