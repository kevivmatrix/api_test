# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
  belongs_to :address

  validates :name, :address_id, presence: true
end
