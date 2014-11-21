# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class School < ActiveRecord::Base
  attr_accessible :name
  has_many :members
  
  validates_uniqueness_of :name, message: 'already exists'
  validates :name, presence: {message: ' cannot be empty'}
end
