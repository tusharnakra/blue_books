# == Schema Information
#
# Table name: send_documents
#
#  id          :integer          not null, primary key
#  subject     :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attachment  :string(255)
#

class SendDocument < ActiveRecord::Base
  attr_accessible :description, :subject, :attachment
  mount_uploader :attachment, AttachmentUploader
  validates :subject, presence: true
  validates_presence_of :attachment
end
