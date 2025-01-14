Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" 
  resources :posts do 
    resources :job_applications#,  only: [:new, :create]
  end
  
  resources :profiles
end
