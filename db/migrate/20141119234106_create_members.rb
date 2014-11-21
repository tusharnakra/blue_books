class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :pennkey
      t.string :first_name
      t.string :last_name
      t.string :email_address

      t.timestamps
    end
  end
end
