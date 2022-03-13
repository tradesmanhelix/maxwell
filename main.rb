#!/usr/bin/ruby -w

require File.join(File.dirname(__FILE__), 'services/shopping_cart_builder')
require File.join(File.dirname(__FILE__), 'services/shopping_cart_price_calculator')

def get_grocery_items_from_user
  puts 'Please enter all the items purchased separated by a comma'
  input = gets.chomp
  items = input.split(',')

  items
end

def print_shopping_cart_price_summary(price_summary)
  summary = price_summary.summary

  summary_rows = ''
  summary[:item_summaries].each do |row|
    summary_rows += "#{row[:item_name].to_s.ljust(9)}#{row[:total_sold].to_s.ljust(14)}#{row[:total_price]}\n"
  end

  output = <<~CART_SUMMARY

    Item     Quantity      Price
    --------------------------------------
    #{summary_rows}

    Total price : #{summary[:cart_total]}
    You saved #{summary[:total_savings]} today.

  CART_SUMMARY

  puts output
end


#------------------------------------------------------------------------------
# MAIN PROGRAM LOOP
#------------------------------------------------------------------------------
while true
  items = get_grocery_items_from_user

  shopping_cart = ShoppingCartBuilder.new.build_cart(items: items)

  summary = ShoppingCartPriceCalculator.new.calculate_total(shopping_cart: shopping_cart)

  print_shopping_cart_price_summary(summary)

  print 'Continue? (y/N)? '
  break if gets.chomp != 'y'
end
