class AddEmailGroupIdToEmailAddresses < ActiveRecord::Migration
  def change
    add_column :email_addresses, :email_group_id, :integer
  end
end
