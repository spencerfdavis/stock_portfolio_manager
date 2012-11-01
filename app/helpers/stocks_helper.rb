module StocksHelper
  def number_to_currency_with_color(num)
    content_tag(:span, number_to_currency(num), :class => currency_color(num))  
  end
  
  def currency_color(num)
    num > 0 ? "green" : "red"    
  end    
  
  def gain_loss(stock_item, market_price)
    value = (market_price-stock_item.purchase_price)*stock_item.quantity
    number_to_currency_with_color(value)
  end
end
