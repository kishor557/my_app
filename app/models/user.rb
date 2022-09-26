class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable
         
         
  has_one :profile, dependent: :destroy

  ## Nested Forms ##
  accepts_nested_attributes_for :profile, allow_destroy: true

  def self.test_method
    puts "Hello from model"
  end

end
