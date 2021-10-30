class Inventory
  def initialize
    @items = []
  end

  def add(*new_items)
    @items += new_items
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
    i = self.new
    i.add('rock', 'paper', 'scissors')
    i
  end

  def empty?
    @items.empty?
  end
end
