class CreatePayers < ActiveRecord::Migration[7.0]
  def change
    create_table :payers do |t|
      t.string :name
      t.integer :points
      t.integer :spent
    end
  end
end
