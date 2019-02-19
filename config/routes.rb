Rails.application.routes.draw do

  get '/sobre', to: 'pages#sobre'
  get '/contato', to: 'pages#contato'
  get '/termos_de_uso', to: 'pages#termos_de_uso'
  get '/politica_de_privacidade', to: 'pages#politica_de_privacidade'
  get "/posts/new", to: "posts#new"
  get "/posts/:slug/livros/new", to: "books#new"
  # get "/posts/:slug/livros/:id/edit", to: "books#edit"
  get "/posts/:slug/livros/:book_slug/edit", to: "books#edit"
  get "/posts/:slug", to: redirect(path: "/%{slug}")
  # get "/posts/:slug/livros/:id", to: redirect(path: "/%{slug}/%{id}")
  get "/posts/:slug/livros/:book_slug", to: redirect(path: "/%{slug}/%{book_slug}")
  
  resources :posts, param: :slug do 
    resources :books, param: :book_slug, path: :livros
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/:slug", to: "posts#show", as: "post_slug"
  # get "/:slug/:id", to: "books#show", as: "slug_id"
  get "/:slug/:book_slug", to: "books#show", as: "slug_book"

  root 'posts#index'
end
