class AddStatusToProducts < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE product_status AS ENUM ('in_stock', 'few_in_stock', 'out_of_stock')
    SQL
    add_column :products, :status, :product_status, null: false, default: 'in_stock'
  end

  def down
    remove_column :products, :status
    execute <<-SQL
      DROP TYPE product_status
    SQL
  end
end
