class CreateNewProducts < ActiveRecord::Migration
  def change
    create_table :new_products do |t|
      t.integer :product_id
      t.timestamps
    end
  end
end
