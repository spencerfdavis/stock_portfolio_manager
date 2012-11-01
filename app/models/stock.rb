class Stock < ActiveRecord::Base
  validate :valid_symbol
  validates_presence_of :symbol, :quantity, :purchase_price
  validates_numericality_of :quantity, :purchase_price
  
  cattr_reader :per_page
  @@per_page = 10
  
  # Custom validation makes remote call to Yahoo Finance to ensure symbol is valid.
  def valid_symbol
    errors.add(:symbol, "is not valid according to yahoo finance") unless StockQuote.valid_symbol?(self.symbol)
  end
  
  # Total Value of all Stocks
  def self.portfolio_value
    total_value = 0.0
    symbol_sums = Stock.select("symbol, sum(quantity) as qty, sum(purchase_price*quantity) as cost").group("symbol")
    stock_quotes = StockQuote.quotes_from_entries(symbol_sums)
    
    symbol_sums.each do |ss|
      market_value = (stock_quotes[ss["symbol"]].ask.to_f*ss.qty.to_f)      
      total_value += market_value.to_f-ss.cost.to_f
    end
    total_value
  end
end
