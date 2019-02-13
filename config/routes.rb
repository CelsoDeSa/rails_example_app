Rails.application.routes.draw do
<<<<<<< HEAD
  
  resources :posts do 
    resources :books
  end
=======
  resources :posts
  resources :books
>>>>>>> a0fb20c7e4bcbcd39e7747e1b4a45cd39c39c446
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

end
