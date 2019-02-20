class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :address
end
