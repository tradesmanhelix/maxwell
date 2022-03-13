require File.join(File.dirname(__FILE__), '../models/shopping_cart')

class ShoppingCartBuilder
  def build_cart(items: [])
    cart = ShoppingCart.new

    items.each do |item_name|
      next if item_name.empty?

      cart.add_item(item_name: item_name)
    end

    cart
  end
end
