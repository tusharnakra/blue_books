# == Schema Information
#
# Table name: email_addresses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#

class EmailAddress < ActiveRecord::Base
  attr_accessible :name, :group_id

  belongs_to :group
  
  validates_uniqueness_of :name
  validates :name, :email => true, presence: {message: ' cannot be empty'}
  validates :group_id, presence: {message: ' cannot be empty'}
  validates_presence_of :group, presence: {message: ' does not exist in the database'}

end


