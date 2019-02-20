# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string
#  city       :string
#  zipcode    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
