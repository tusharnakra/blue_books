class SendDocument < ActiveRecord::Base
  attr_accessible :description, :subject, :attachment
  mount_uploader :attachment, AttachmentUploader
  validates :subject, presence: true
  validates_presence_of :attachment
end
