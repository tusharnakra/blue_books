# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  pennkey       :string(255)
#  first_name    :string(255)
#  last_name     :string(255)
#  email_address :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  school_id     :integer
#

class Member < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :pennkey, :school_id
  belongs_to :school

  validates_uniqueness_of :email_address, message: 'already exists' 
  validates_uniqueness_of :pennkey, message: 'already exists'
  validates :email_address, presence: {message: ' cannot be empty'}
  validates :first_name, presence: {message: ' cannot be empty'}
  validates :last_name, presence: {message: ' cannot be empty'}
  validates :pennkey, presence: {message: ' cannot be empty'}
end
