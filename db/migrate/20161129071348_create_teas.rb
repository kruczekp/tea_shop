class CreateTeas < ActiveRecord::Migration[5.0]
  def change
    create_table :teas do |t|
      t.string :name, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.text :description
      t.integer :quantity, null: false, default: 0
      t.timestamps
    end
  end
end
