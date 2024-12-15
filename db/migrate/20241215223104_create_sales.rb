class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.decimal :amount
      t.datetime :sale_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
