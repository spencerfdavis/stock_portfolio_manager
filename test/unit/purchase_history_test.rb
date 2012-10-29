require 'test_helper'

class PurchaseHistoryTest < ActiveSupport::TestCase
  test "should not save without symbol" do
    ph = PurchaseHistory.new
    ph.purchase_price=1.05
    ph.quantity=50
    assert !ph.save
  end
  
  test "should not save without quantity" do
    ph = PurchaseHistory.new
    ph.symbol="AAPL"
    ph.purchase_price=1.05
    assert !ph.save
  end  
  
  test "should not save without price" do
    ph = PurchaseHistory.new
    ph.symbol="AAPL"
    ph.quantity=50    
    assert !ph.save
  end
end
