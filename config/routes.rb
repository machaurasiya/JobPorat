Rails.application.routes.draw do
  # get 'job_applications/show'
  # get 'job_applications/new'
  # get 'job_applications/edit'
  # get 'profiles/index'
  # get 'profiles/new'

  
  devise_for :users

  root to: "home#index" 
  # get 'home/index'

  resources :posts do 
    resources :job_applications#,  only: [:new, :create]
  end
  
  resources :profiles

  
end
