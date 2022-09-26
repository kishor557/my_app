class Listing < ApplicationRecord
  belongs_to :category
  
  has_many :comments, as: :commentable, dependent: :destroy
  
  has_and_belongs_to_many :features
  
  has_many_attached :listing_images
end
