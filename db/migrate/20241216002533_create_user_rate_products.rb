class CreateUserRateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :user_rate_products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :rate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
