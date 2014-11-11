class CreateRequestAccesses < ActiveRecord::Migration
  def change
    create_table :request_accesses do |t|
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
