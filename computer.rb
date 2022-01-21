require_relative 'inventory'

class Computer
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

  def comp_inventory #comp is short for computer :3
    @inventory
  end
end
