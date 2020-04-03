Rails.application.routes.draw do

  resources :users
  resources :videos
  resources :youtubes
  resources :trendings

  #  Pages routes
  root 'pages#home'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/pages/contact', to: 'pages#submit_contact_info', via: 'post'
  match '/pages/contact', to: 'pages#contact_success', via: 'get'
  match '/pages/search', to: 'pages#search', via: 'get'
  match '/pages/status', to: 'pages#status', via: 'get'
  match '/sitemap', to: 'pages#sitemap', via: 'get'
  match '/advertise', to: 'pages#advertise', via: 'get'
  match '/about', to: 'pages#about', via: 'get'
  match '/subscribe', to: 'pages#subscribe', via: 'get'
  match '/terms', to: 'pages#terms', via: 'get'
  match '/privacy', to: 'pages#privacy', via: 'get'

  # Videos routes
  match '/watch', to: 'videos#watch', via: 'get'
  match '/accept', to: 'videos#accept', via: 'get'
  match '/processed', to: 'videos#processed', via: 'get'
  match '/videos/new/manual', to: 'videos#manual', via: 'get'
  match '/submit', to: 'videos#submit', via: 'get'



  # Admin routes
  match '/admin', to: 'admins#index', via: 'get'
  match '/admin/login', to: 'sessions#new', via: 'get'
  match '/admin/logout', to: 'sessions#destroy', via: 'DELETE'
  match '/admin/login', to: 'sessions#create', via: 'post'

end
