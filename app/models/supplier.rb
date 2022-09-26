class Supplier < ApplicationRecord
  has_one :account, dependent: :destroy
  
  accepts_nested_attributes_for :account, allow_destroy: true
end
