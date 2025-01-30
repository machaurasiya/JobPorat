Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" 
  
  resources :posts do 
    resources :job_applications do
      member do
        patch :update_status
      end
    end
  end
  
  resources :profiles
  resources :companies do
    resources :posts, only: [:index, :show]
  end
end
