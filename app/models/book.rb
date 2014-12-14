# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  attachment :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
  attr_accessible :attachment, :name
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :attachment
end
