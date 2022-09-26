# README

# RealEstate 

0. User
   - name
   - email
   - password
   
   has_one :profile
   has_many :listings
   

00. Profile
   - full_name
   - phone
   - address
   - pin_code
   - profile_picture
   
   belongs_to :user

1. Category
   - name
   - code
   
   has_many :listings
   has_many :comments
 
11. Feature
    - name
    - description
    - is_active
  
    has_and_belongs_to_many :listings
    
2. Listing
  - name
  - price
  - address
  - pin_code
  - phone
  - description
  
  belongs_to :category
  has_many :listing_images
  has_many :comments
  
  has_and_belongs_to_many :features
  
3. Comment:
  - content
  - user_id
  - commentable_id
  - commentable_type

3. ListingImage
   
   

https://medium.com/swlh/polymorphic-associations-in-rails-with-example-8375de65510b

https://medium.com/swlh/how-to-upload-images-into-your-rails-project-using-active-storage-1285a69e4cf5
