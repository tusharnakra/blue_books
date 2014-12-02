class CreateSendDocuments < ActiveRecord::Migration
  def change
    create_table :send_documents do |t|
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
