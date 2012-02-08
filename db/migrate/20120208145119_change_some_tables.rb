class ChangeSomeTables < ActiveRecord::Migration
  def up
    remove_column :addresses, :address_type
    remove_column :addresses, :resource_id
    remove_column :addresses, :resource_type
    add_column :payers, :street, :string
    add_column :payers, :zip_code, :string
    add_column :payers, :city, :string
    add_column :payers, :house_number, :string
    add_column :payers, :apartment_number, :string
  end

  def down
  end
end
