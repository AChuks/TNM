Rails.application.routes.draw do

  resources :users
  resources :videos
  resources :youtubes
  resources :trendings

  #  Pages routes
  root 'pages#home'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/advertise', to: 'pages#advertise', via: 'get'
  match '/about', to: 'pages#about', via: 'get'
  match '/subscribe', to: 'pages#subscribe', via: 'get'
  match '/terms', to: 'pages#terms', via: 'get'

  # Videos routes
  match '/watch', to: 'videos#watch', via: 'get'

  # Admin routes
  match '/admin', to: 'admins#index', via: 'get'
  match '/admin/login', to: 'sessions#new', via: 'get'
  match '/admin/login', to: 'sessions#create', via: 'post'

end
