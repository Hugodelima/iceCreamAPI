class CreateRates < ActiveRecord::Migration[7.2]
  def change
    create_table :rates do |t|
      t.string :star
      t.text :comment

      t.timestamps
    end
  end
end
