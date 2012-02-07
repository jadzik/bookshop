class ChangeDatabaseAgain < ActiveRecord::Migration
  def up
    remove_column :payers, :company_id
    add_column :payers, :client_id, :integer
  end

  def down
  end
end
