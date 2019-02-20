class Customer < ApplicationRecord
  belongs_to :address

  validates :name, :address_id, presence: true
end
