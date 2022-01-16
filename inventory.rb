class Inventory
  def initialize
    @items = []
  end

  def add(*new_items)
    @items += new_items
  end

  def add_quantity(item, quantity)
    @items += [item] * quantity
  end

  def remove(item)
    i = @items.find_index(item)
    @items.delete_at i unless i.nil?
  end

  def list
    @items
  end

  def find(item)
    @items.find_index(item)
  end

  def self.default
    new_inventory = self.new
    new_inventory.add_quantity("rock", 2)
    new_inventory.add_quantity("paper", 2)
    new_inventory.add_quantity("scissors", 2)
    new_inventory
  end

  def empty?
    @items.empty?
  end

  def tally
    @items.tally
  end

  def string_tally
    tally.map { |item, quantity| "#{item} x#{quantity}" }
  end

  def item_from_string_tally(tally)
    tally.gsub(/(.+) x\d+/, '\1')
  end

  def print_choices(menu)
    menu.choices(*string_tally, &method(:item_from_string_tally))
  end
end
