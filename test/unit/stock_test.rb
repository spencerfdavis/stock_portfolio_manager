require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test "should not save without symbol" do
    p = Stock.new
    p.purchase_price=1.05
    p.quantity=50
    assert !p.save
  end
  
  test "should not save without quantity" do
    p = Stock.new
    p.symbol="AAPL"
    p.purchase_price=1.05
    assert !p.save
  end  
  
  test "should not save without numerical quantity" do
    p = Stock.new
    p.symbol="AAPL"
    p.purchase_price=1.05
    p.quantity = "hey"
    assert !p.save
  end
  
  test "should not save without numerical purchase_price" do
    p = Stock.new
    p.symbol="AAPL"
    p.purchase_price="cool"
    p.quantity = 50
    assert !p.save
  end  
  
  test "should not save without price" do
    p = Stock.new
    p.symbol="AAPL"
    p.quantity=50    
    assert !p.save
  end
end
