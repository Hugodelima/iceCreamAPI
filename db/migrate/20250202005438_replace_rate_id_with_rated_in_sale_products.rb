class ReplaceRateIdWithRatedInSaleProducts < ActiveRecord::Migration[7.2]
  def change
    # Remove a coluna 'rate_id'
    remove_column :sale_products, :rate_id, :bigint
    
    # Adiciona a coluna 'rated' do tipo boolean
    add_column :sale_products, :rated, :boolean, default: false, null: false
  end
end
