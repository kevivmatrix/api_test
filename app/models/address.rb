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

class Address < ApplicationRecord
  has_many :customers, dependent: :nullify

  validates :street, :city, :zipcode, presence: true
end
