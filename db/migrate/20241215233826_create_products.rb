class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :brand
      t.decimal :value
      t.string :size
      t.integer :quantity
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
