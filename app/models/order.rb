class Order < ApplicationRecord
  belongs_to :user
  has_many :items

  accepts_nested_attributes_for :items
end
