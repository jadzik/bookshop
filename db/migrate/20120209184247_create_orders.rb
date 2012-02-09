class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.timestamps
      t.string :status, :default => "cart"
      t.integer :client_id
      t.integer :address_id
      t.integer :payer_id 
      t.string :payment_type 
      t.string :delivery_type
      t.text :comments
      t.float :summary_price
    end
  end
end
