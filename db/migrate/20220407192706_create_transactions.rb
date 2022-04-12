class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :points
      t.integer :spentpoints
      t.belongs_to :payer
      t.datetime :timestamp
    end
  end
end
