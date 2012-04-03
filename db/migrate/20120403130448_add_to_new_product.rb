class AddToNewProduct < ActiveRecord::Migration
  def up
    remove_column :new_products, :product_id
    add_column :new_products, :resource_type,  :string
    add_column :new_products, :resource_id, :integer
  end

  def down
  end
end
