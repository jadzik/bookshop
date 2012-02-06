class RemoveStatusFromClient < ActiveRecord::Migration
  def up
    remove_column :clients, :status
  end

  def down
  end
end
