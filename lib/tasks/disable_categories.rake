namespace :db do
  task :disable_categories => :environment do
#    Category.all.each do |c|
#      c.update(is_active: false)
#    end
    
    #OR#
    
    Category.update_all(is_active: false)
  end
end
