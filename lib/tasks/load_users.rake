namespace :db do
  task :load_users => :environment do
    puts "I'm in rake task"
#    (0..20).to_a.each do |i|
#      User.create({email: "testuser#{i}@gmail.com", password: "ginger79", password_confirmation: "ginger79", profile: Profile.new(full_name: "testuser#{i}")})
#    end
    User.test_method
    puts "Done"
  end
end
