# == Schema Information
#
# Table name: send_documents
#
#  id          :integer          not null, primary key
#  subject     :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attachment  :string(255)
#

require 'test_helper'

class SendDocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
