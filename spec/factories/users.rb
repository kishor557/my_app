FactoryBot.define do
  factory :user, class: 'User' do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { Time.now }
  end
end
