class Category < ApplicationRecord

  ## validations ##
  # presence 
  validates :name, presence: { message: 'is required' }
  
  # uniqueness
  validates :name, uniqueness: true
  
  # acceptance
#  validates :is_active, acceptance: { message: 'must be True' }
  
  #confirmation
  validates :code, confirmation: true

  # exclusion: exclude the given list/don't allow the given list as code
#  validates :code, exclusion: { in: ['CAT1', 'CAT2'], message: "%{value} is reserved." }

  # inclusion: allow the only given list as code
#  validates :code, inclusion: { in: ['CAT4', 'CAT5', 'CAT6'], message: "%{value} is reserved." }
  
  #numericality
#  validates :code, numericality: true

  #format
#  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  # custom validation
#  validate :verify_name_and_code, unless: -> { name.blank? }
  
  
  ## scopes ##
  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }
  scope :filter_by, ->(q) { where('name LIKE ?', "%#{q}%") }


  ## Callbacks ##
#  before_validation do
#    puts "\n\n....Before Validation........\n"
#  end
#  
#  after_validation do
#    puts "\n\n....After Validation........\n"
#  end
#  
#  before_save unless: -> { is_active == true } do 
#    puts "\n\n....Before Save...#{self.name}........\n"
#    self.name = name.upcase unless name.blank?
#  end
  
  before_save :before_save_method, unless: :check_condition?
#  
#  after_save do
#    puts "\n\n....After Save...#{self.name}........\n"
#  end
#  
#  around_save :around_something
#  
#  before_create do
#    puts "\n\n....Before Create........\n"
#  end
#  
#  before_update do
#    puts "\n\n....Before Update........\n"
#  end

#  before_destroy :destroy_method
  
#  after_commit :commit_method, on: [:create]

#  after_initialize do
#    puts "\n\n....After INIT........\n" 
#  end
  
#  after_find do
#    puts "\n\n....After FIND........\n" 
#  end

  ## ASSOCIAITONS ##
  has_many :listings, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  
  has_one_attached :image
  
  
	validate :acceptable_image

	def acceptable_image
	  return unless image.attached?

	  # validate image is more than 1 MB
	  unless image.byte_size <= 1.megabyte
	    errors.add(:image, "is too big")
	  end

	  # accept only images
	  acceptable_types = ["image/jpeg", "image/png"]
	  unless acceptable_types.include?(image.content_type)
	    errors.add(:image, "must be a JPEG or PNG")
	  end
	end  

  private
  
  def before_save_method
    puts "\n\n....Before Save...#{self.name}........\n"
   self.name = name.upcase
  end
  
  def check_condition?
    name.blank?
  end

  def commit_method
      puts "\n\n....After COMMIT........\n" 
  end
  
  def destroy_method
    puts "\n\n....Before Destroy........\n"
  end
  
  def around_something
    puts "\n\n\nCalling Method: In Around Save\n\n"
    yield
    puts "\n\n\nCalling Method: Out Around Save\n\n"
  end

  
  def verify_name_and_code
    puts "\n\n....custom validation.....\n"
    if name != "kishor" && code != "KISHOR"
      errors.add(:base, 'Name and Code are not allowed')
    end
  end
end
