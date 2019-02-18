Rails.application.routes.draw do

  get "/posts/new", to: "posts#new"
  get "/posts/:slug/livros/new", to: "books#new"
  get "/posts/:slug/livros/:id/edit", to: "books#edit"
  get "/posts/:slug", to: redirect(path: "/%{slug}")
  get "/posts/:slug/livros/:id", to: redirect(path: "/%{slug}/%{id}")
  
  resources :posts, param: :slug do 
    resources :books, path: :livros
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  get "/:slug", to: "posts#show", as: "post_slug"
  get "/:slug/:id", to: "books#show", as: "slug_id"

  root 'posts#index'
end
