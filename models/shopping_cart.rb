class ShoppingCart
  def initialize
    # This will set the hash's default value for keys to 0
    @items = Hash.new(0)
  end

  def add_item(item_name: '')
    raise 'Unable to add unnamed item to cart' if item_name.empty?

    @items[item_name] += 1
  end

  def item_count(item_name: '')
    @items[item_name]
  end
end
