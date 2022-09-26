class Feature < ApplicationRecord
  max_paginates_per 5

  has_and_belongs_to_many :listings

  validates :name, presence: true
  validates :name, uniqueness: true

  #scopes
  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }

end
