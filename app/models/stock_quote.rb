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
  
  def self.quotes_from_entries(stock_entries)
    return if stock_entries.blank?
    
    quotes = {}    
    symbol_str = stock_entries.map{|e| e.symbol}.uniq.join("+")
    data = Net::HTTP.get URI.parse("http://download.finance.yahoo.com/d/quotes.csv?s=#{symbol_str}&f=absn")
    return if data.blank?
    
    puts data.inspect
    data.split("\r\n").each do |quote|
      q = quote.split(",")
      sq = StockQuote.new
      sq.ask = q[0].to_f
      sq.bid = q[1].to_f
      sq.symbol = q[2].gsub(/\"/, "")
      sq.holding = q[3].gsub(/\"/, "")      
      quotes[sq.symbol] = sq
    end
    quotes
  end
end