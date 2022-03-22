require File.join(File.dirname(__FILE__), '../models/shopping_cart')

class ShoppingCartBuilder
  def build_cart(items: [])
    cart = ShoppingCart.new

    items.each do |item_name|
      next unless item_name.is_a?(String)
      next if item_name.empty?

      item_name = item_name.downcase
      next unless valid_item?(item_name: item_name)

      cart.add_item(item_name: item_name)
    end

    cart
  end

  private

  def valid_item?(item_name:)
    valid_items.include?(item_name)
  end

  def valid_items
    ['apple', 'banana', 'bread', 'milk']
  end
end
