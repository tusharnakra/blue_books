class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :name

      t.timestamps
    end
  end
end
