class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :retrieve_portfolio_value
  
  
  def retrieve_portfolio_value
    @total_stocks = Stock.count
    @portfolio_value = Stock.portfolio_value
  end
end
