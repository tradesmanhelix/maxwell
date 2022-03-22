class ShoppingCartPriceSummary
  attr_writer(:cart_total, :total_savings)

  def initialize
    @item_summaries = []
  end

  def add_item_summary(item_name: nil, total_sold: nil, total_price: nil)
    @item_summaries.push({
      item_name: item_name,
      total_sold: total_sold,
      total_price: format_money(total_price)
    })
  end

  def summary
    {
      item_summaries: @item_summaries,
      cart_total: format_money(@cart_total),
      total_savings: format_money(@total_savings)
    }
  end

  private

  def format_money(val)
    format("%.2f", val)
  end
end
