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

require 'test_helper'

class EmailAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
