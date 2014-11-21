class AddGroupIdToEmailAddresses < ActiveRecord::Migration
  def change
    add_column :email_addresses, :group_id, :integer
  end
end
