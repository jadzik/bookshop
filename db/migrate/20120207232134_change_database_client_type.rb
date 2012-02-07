class ChangeDatabaseClientType < ActiveRecord::Migration
  def up
    remove_column :clients, :type
    add_column :clients, :client_type, :string
  end

  def down
  end
end
