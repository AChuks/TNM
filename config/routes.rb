Rails.application.routes.draw do

  resources :users
  resources :videos
  resources :youtubes
  resources :trendings

  #  Pages routes
  root 'pages#home'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/pages/contact', to: 'pages#submit_contact_info', via: 'post'
  match '/pages/search', to: 'pages#search', via: 'get'
  match '/pages/status', to: 'pages#status', via: 'get'
  match '/sitemap', to: 'pages#sitemap', via: 'get'
  match '/advertise', to: 'pages#advertise', via: 'get'
  match '/about', to: 'pages#about', via: 'get'
  match '/subscribe', to: 'pages#subscribe', via: 'get'
  match '/terms', to: 'pages#terms', via: 'get'

  # Videos routes
  match '/watch', to: 'videos#watch', via: 'get'
  match '/preview/:id', to: 'videos#preview', via: 'get', :as => :preview
  match '/accept/:id', to: 'videos#accept', via: 'get', :as => :accept
  match '/processed/:id', to: 'videos#processed', via: 'get', :as => :processed


  # Admin routes
  match '/admin', to: 'admins#index', via: 'get'
  match '/admin/login', to: 'sessions#new', via: 'get'
  match '/admin/logout', to: 'sessions#destroy', via: 'DELETE'
  match '/admin/login', to: 'sessions#create', via: 'post'

end
