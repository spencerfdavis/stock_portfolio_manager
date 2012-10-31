class PurchaseHistory < ActiveRecord::Base
  validates_presence_of :symbol, :quantity, :purchase_price
  validates_numericality_of :quantity, :purchase_price
end
