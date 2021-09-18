# frozen_string_literal: true
WEAPONS = ['rock', 'paper', 'scissors', 'star']
puts 'Welcome to.....'
puts 'ROCK, PAPER, SCISSORS, STAR!'
puts 'Choose Your Weapon:'
player_weapon = gets
puts 'You chose...'
puts player_weapon
computer_weapon = WEAPONS.sample # totally random!
puts 'Computer chose...'
puts computer_weapon
print computer_weapon
print ' destroys '
puts player_weapon
puts 'YOU LOSE!!!!!'
puts 'Computer: "Mwahhahaahah! I win again, Sucker!"'
