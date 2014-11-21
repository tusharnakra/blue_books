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

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
