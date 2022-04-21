class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :points
      t.integer :points_available
      t.belongs_to :payer
      t.datetime :timestamp
    end
  end
end
