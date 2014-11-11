# == Schema Information
#
# Table name: request_accesses
#
#  id          :integer          not null, primary key
#  subject     :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RequestAccess < ActiveRecord::Base
  attr_accessible :description, :subject

  validates :description, presence: {message: ' cannot be empty'}
  validates :subject, presence: {message: ' cannot be empty'}
end
