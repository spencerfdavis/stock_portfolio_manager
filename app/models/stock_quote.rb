require 'net/http'

class StockQuote
  attr_accessor :symbol, :holding, :bid, :ask
  
  #Determines if users input value for symbol is a legitimate 
  def self.valid_symbol?(symbol)
    data = Net::HTTP.get URI.parse("http://download.finance.yahoo.com/d/quotes.csv?s=#{symbol}&f=nab") 
    q = data.split(",")  
    return false if q[1].eql?("N/A") || q[2].eql?("N/A")
    true
  end
  
  def self.quotes_from_entries(portfolio_entries)
    symbols = portfolio_entries.map{|e| e.symbol}
    #quotes = []
    quotes = {}
    #symbol_str = symbols.is_a?(Array) ? symbols.join("+") : symbols
    symbol_str = symbols.join("+")
    data = Net::HTTP.get URI.parse("http://download.finance.yahoo.com/d/quotes.csv?s=#{symbol_str}&f=nabs")
    return if data.blank?
    
    puts data.inspect
    data.split("\r\n").each do |quote|
      q = quote.split(",")
      sq = StockQuote.new
      sq.holding = q[0].gsub(/\"/, "")
      sq.ask = q[1].to_f
      sq.bid = q[2].to_f
      sq.symbol = q[3].gsub(/\"/, "")
      quotes[sq.symbol] = sq
    end
    quotes
  end
end