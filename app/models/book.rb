class Book < ActiveRecord::Base
  attr_accessible :attachment, :name
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :attachment
end
