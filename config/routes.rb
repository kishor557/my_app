Rails.application.routes.draw do
  resources :suppliers

  devise_for :users, controllers: {registrations: 'users/registrations'}

  resources :listings do
    resources :comments, only: [:create]
  end
    
  resources :features
  
  
#  resources :comments, only: [:create]
  
  ## Defining a route for single action ##
    #get 'categories/index'
    
    ## OR ##
    
    resources :categories do #, only: [:index, :new, :create]
      collection do
        get 'download_file'
      end
      
      member do
        get 'view_category'
      end
      
      resources :comments, only: [:create]
    end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  namespace :api, defaults: {format: 'json'}  do
    namespace :v1 do
      
      resources :categories
      
    end
  end  

  # Defines the root path route ("/")
  root "categories#index"
end
