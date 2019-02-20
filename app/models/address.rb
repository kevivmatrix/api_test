class Address < ApplicationRecord
  validates :street, :city, :zipcode, presence: true
end
