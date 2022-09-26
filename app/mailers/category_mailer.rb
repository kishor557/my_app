class CategoryMailer < ApplicationMailer

  # email when category created
  def notify_category_created(category_id)
    @category = Category.find(category_id)
    @url  = 'http://example.com/login'
    mail(to: 'kishor.07557@gmail.com', subject: 'Category Created')
  end


end
