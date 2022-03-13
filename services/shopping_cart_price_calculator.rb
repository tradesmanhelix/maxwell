class ShoppingCartPriceCalculator
  def calculate_total(shopping_cart: nil)
    raise 'Unable to calculate total for invalid cart' if shopping_cart.nil? || !shopping_cart.is_a?(ShoppingCart)

    cart_total = 0
    savings = 0
    current_unit_price_data.each do |name, price_data|
      item_total = 0
      qty = shopping_cart.item_count(item_name: name)

      item_is_on_sale = price_data[:is_on_sale]
      sale_quantity = price_data[:sale_quantity]
      sale_price = price_data[:sale_price]
      unit_price = price_data[:unit_price]

      # Calculate price given any sales
      if item_is_on_sale
        # The user has to be buying at least the number of items
        # required to get the sale price
        if qty >= sale_quantity
          qty -= sale_quantity
          item_total += sale_price

          # Calculate the amount saved
          would_have_paid = sale_quantity * unit_price
          savings += would_have_paid - sale_price
        end
      end

      # Calculate the non-sale price
      item_total += qty * unit_price

      # Add to the total running price for the cart
      cart_total += item_total
    end

    "$#{cart_total.round(2)}"
  end

  private

  def current_unit_price_data
    # In a real app, this would read from a database or API or something probably
    {
      'apple': {
        unit_price: 0.89,
        is_on_sale: false,
        sale_price: nil,
        sale_quantity: nil
      },
      'banana': {
        unit_price: 0.99,
        is_on_sale: false,
        sale_price: nil,
        sale_quantity: nil
      },
      'bread': {
        unit_price: 2.17,
        is_on_sale: true,
        sale_price: 6.00,
        sale_quantity: 3
      },
      'milk': {
        unit_price: 3.97,
        is_on_sale: true,
        sale_price: 5.00,
        sale_quantity: 2
      }
    }
  end
end
