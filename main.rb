#!/usr/bin/ruby -w

require File.join(File.dirname(__FILE__), 'services/shopping_cart_builder')
require File.join(File.dirname(__FILE__), 'services/shopping_cart_price_calculator')

items = ['milk','milk','bread','banana','bread','bread','bread','milk','apple','']

shopping_cart = ShoppingCartBuilder.new.build_cart(items: items)

raise 'Wrong count milk!' if shopping_cart.item_count(item_name: 'milk') != 3
raise 'Wrong count bread!' if shopping_cart.item_count(item_name: 'bread') != 4
raise 'Wrong count apple!' if shopping_cart.item_count(item_name: 'apple') != 1
raise 'Wrong count banana!' if shopping_cart.item_count(item_name: 'banana') != 1
raise 'Wrong count empty!' if shopping_cart.item_count(item_name: '') != 0

raise 'This should fail!' if ShoppingCartPriceCalculator.new.calculate_total(shopping_cart: shopping_cart) != '$19.02'
