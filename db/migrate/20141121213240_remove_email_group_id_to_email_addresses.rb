class RemoveEmailGroupIdToEmailAddresses < ActiveRecord::Migration
  def up
    remove_column :email_addresses, :email_group_id
  end

  def down
    add_column :email_addresses, :email_group_id, :integer
  end
end
