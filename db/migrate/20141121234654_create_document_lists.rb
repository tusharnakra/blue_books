class CreateDocumentLists < ActiveRecord::Migration
  def change
    create_table :document_lists do |t|
      t.string :document_name

      t.timestamps
    end
  end
end
