class AddAttachmentToSendDocuments < ActiveRecord::Migration
  def change
    add_column :send_documents, :attachment, :string
  end
end
