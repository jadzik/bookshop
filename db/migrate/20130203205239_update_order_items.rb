class UpdateOrderItems < ActiveRecord::Migration
  def up
    remove_column :order_items, :amount
    add_column :order_items, :amount, :integer, default: 1
  end

  def down
  end
end
