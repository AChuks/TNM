Rails.application.routes.draw do


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

  #  Videos routes
  match '/watch', to: 'videos#watch', via: 'get'
  match '/vsubmit', to: 'videos#submit_video', via: 'get'

end
