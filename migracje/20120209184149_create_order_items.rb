class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.timestamps
      t.integer :product_id
      t.float :price_for_one
      t.integer :amount
      t.string :name_of_product
      t.integer :order_id
    end
  end
end
