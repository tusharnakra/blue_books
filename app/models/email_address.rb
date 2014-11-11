# == Schema Information
#
# Table name: email_addresses
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  email_group_id :integer
#

class EmailAddress < ActiveRecord::Base
  attr_accessible :name, :email_group_id

  belongs_to :email_group
  
  validates :name, :email => true, presence: {message: ' cannot be empty'}
  validates :email_group_id, presence: {message: ' cannot be empty'}
  validates_presence_of :email_group, presence: {message: ' does not exist in the database'}

end


