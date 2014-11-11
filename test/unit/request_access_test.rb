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

require 'test_helper'

class RequestAccessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
