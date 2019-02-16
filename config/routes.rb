Rails.application.routes.draw do

  resources :posts, param: :slug do 
    resources :books
  end

  get "/:slug", to: "posts#show"  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'
end
