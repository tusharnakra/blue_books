# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :name
  #has_many :email_addresses
  has_many :members
  validates_uniqueness_of :name
  validates :name, presence: {message: ' cannot be empty'}
end
