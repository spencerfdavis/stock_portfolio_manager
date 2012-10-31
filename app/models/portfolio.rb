class Portfolio < ActiveRecord::Base
  validates_presence_of :symbol, :quantity, :purchase_price
  validates_numericality_of :quantity, :purchase_price
  
  
  
  # def self.calc_value
  #   total_value = 0
  #   symbols = self.pluck(:symbol)
  #   stock_quotes = StockQuote.quotes_from_symbols(symbols)
  #   
  #   # symbol_sums = self.select("symbol, sum(quantity) as total_qty, (purchase_price*quantity) as cost").group("symbol")
  #   symbol_sums = self.select("symbol, sum(quantity) as qty, sum(purchase_price*quantity) as cost").group("symbol")
  #       
  #   symbol_sums.each do |sum|
  #     puts "SUM Boy:#{sum['symbol']} - total_qty:#{sum['total_qty']} - Cost:#{sum['cost']}"
  #     
  #     #puts "Market boy:Ask - #{(stock_quotes[sum['symbol']].ask} - Total QTY:#{sum.total_qty}"
  #     puts "Market boy:Ask - #{stock_quotes[sum['symbol']].ask}"
  #     puts "Total QTY:#{sum.total_qty}"
  #     
  #     market_value = (stock_quotes[sum["symbol"]].ask.to_f*sum.total_qty.to_f)
  #     puts "Market Value:#{market_value}"
  #     
  #     total_value += market_value.to_f-sum.cost.to_f
  #     puts "Total Value:#{total_value}"
  #   end
  #   total_value
  # end
end
