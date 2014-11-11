# == Schema Information
#
# Table name: email_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmailGroup < ActiveRecord::Base
  attr_accessible :name
  has_many :email_addresses
  validates :name, presence: {message: ' cannot be empty'}
end
