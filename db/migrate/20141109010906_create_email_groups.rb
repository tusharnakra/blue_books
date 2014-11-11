class CreateEmailGroups < ActiveRecord::Migration
  def change
    create_table :email_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
