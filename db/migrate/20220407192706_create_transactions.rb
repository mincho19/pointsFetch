class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :points
      t.belongs_to :payer
      t.timestamps
    end
  end
end
