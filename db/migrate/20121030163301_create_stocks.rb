class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.integer :quantity
      t.float :purchase_price

      t.timestamps
    end
  end
end
