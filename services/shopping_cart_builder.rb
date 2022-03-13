require File.join(File.dirname(__FILE__), '../models/shopping_cart')

class ShoppingCartBuilder
  def build_cart(items: [])
    ShoppingCart.new
  end
end
