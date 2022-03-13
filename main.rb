#!/usr/bin/ruby -w

require File.join(File.dirname(__FILE__), 'services/shopping_cart_builder')
require File.join(File.dirname(__FILE__), 'services/shopping_cart_price_calculator')

items = ['milk','milk','bread','banana','bread','bread','bread','milk','apple','','Buzz Lightyear']

shopping_cart = ShoppingCartBuilder.new.build_cart(items: items)

raise 'This should fail!' if ShoppingCartPriceCalculator.new.calculate_total(shopping_cart: shopping_cart) != '$19.02'
