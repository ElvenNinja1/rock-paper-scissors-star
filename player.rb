require_relative 'inventory'

class Player
  def initialize
    @inventory = Inventory.default
    @score = 0
  end

  def increase_score
    @score += 1
  end

  def score
    @score
  end

  def your_inventory
    @inventory
  end
end