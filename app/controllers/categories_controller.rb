class CategoriesController < ApplicationController
  #http_basic_authenticate_with name: "srinivas1", password: "srinivas1"
 # layout 'new_layout' #, except: [:index, :new]
  
  before_action :load_category, only: [:show, :edit, :update, :destroy, :view_category]
  after_action :display_message

  def index
    @categories = if params[:q]
                    Category.active.filter_by(params[:q].chomp)
                  else
                    # fetch only active records
                    Category.inactive
                  end
    
    @categories = @categories.paginate(:page => params[:page], :per_page => 5)
    
    puts "\n..COUNT..#{@categories.size}....\n"
    respond_to do |format|
      format.html { }
      format.js   { render layout: false }
      format.xml  { render xml: @categories }
      format.json { render json: @categories }
    end
  end
  
  def show
    redirect_to categories_path, alert: 'Record not found' and return if @category.nil?

    # if you want to render layout for single action
    #render layout: 'other_layout'
  end  
  
  def new
    @category = Category.new
  end
  
  # params:
  # {"authenticity_token"=>"[FILTERED]", "category"=>{"name"=>"Category5", "code"=>"CAT5", "is_active"=>"1"}, "commit"=>"Save"}
  def create
    @category = Category.new(category_params)
    if @category.save
      CategoryMailer.notify_category_created(@category.id).deliver_now
      redirect_to categories_path, notice: 'Category created'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
   puts "\n\n..........Update1........\n"
   if @category.update(category_params)
      redirect_to categories_path, notice: 'Category updated'
    else
      render :edit
    end
     puts "\n\n..........Update2........\n"
  end
  
  def destroy
     @category.destroy
     redirect_to categories_path, notice: 'Category deleted'
  end
  
  # download file
  # send_file: method is used to download the file into your local system
  def download_file
#    send_file("#{Rails.root}/public/sample.pdf", filename: "sample.pdf", type: "application/pdf")
    send_file("#{Rails.root}/public/mvc.jpeg", filename: "MVC.jpeg", type: "image/jpeg")
  end
  
  def view_category
  end
  
  private
  
  def load_category
     puts "\n\n..........load1........\n"
    @category = Category.find_by_id(params[:id])
     puts "\n\n..........load2........\n"
  end
  
  def display_message
    puts "\n\n.....display_message...........\n"
    flash[:notice] = "Loading #{action_name}"
  end
  
  def category_params
    params.require(:category).permit(:name, :code, :is_active, :code_confirmation, :image)
  end

end
