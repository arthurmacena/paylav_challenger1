Rails.application.routes.draw do
  resources :reports do
    collection { post :import }
  end
  
  resources :document, only: [:new, :create]
  
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
 
  root to: 'welcome#index'
  
  get 'welcome/index' 
end
