Rails.application.routes.draw do

  resources :users

  resources :videos
  resources :youtubes
  resources :trendings

  root 'pages#home'
  match '/watch', to: 'videos#watch', via: 'get'
  match '/vsubmit', to: 'videos#submit_video', via: 'get'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/advertise', to: 'pages#advertise', via: 'get'
  match '/about', to: 'pages#about', via: 'get'
  match '/subscribe', to: 'pages#subscribe', via: 'get'
  match '/terms', to: 'pages#terms', via: 'get'

   # TheComments routes
  concern   :user_comments,  TheComments::UserRoutes.new
  concern   :admin_comments, TheComments::AdminRoutes.new
  resources :comments, concerns:  [:user_comments, :admin_comments]
end
