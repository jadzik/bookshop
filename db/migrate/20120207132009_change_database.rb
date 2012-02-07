class ChangeDatabase < ActiveRecord::Migration
  def up
    drop_table :users
    drop_table :companies
    add_column :clients, :name, :string
    add_column :clients, :fax_phone, :string
    add_column :clients, :stationary_phone, :string
    add_column :clients, :type, :string
    add_column :clients, :nip, :string
    add_column :clients, :mobile_phone, :string
    add_column :clients, :contact_comments, :text
    remove_column :clients, :resource_id
    remove_column :clients, :resource_type
  end

  def down
  end
end
