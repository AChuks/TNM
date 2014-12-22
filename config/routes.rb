Rails.application.routes.draw do

  root 'pages#home'

  match '/videos', to: 'pages#videos', via: 'get'
  match '/submit_video', to: 'videos#submit_video', via: 'get'
  match '/trending_videos', to: 'videos#trending_videos', via: 'get'
  match '/must_viewed_videos', to: 'videos#must_viewed_videos', via: 'get'
  match '/newest_videos', to: 'videos#newest_videos', via: 'get'
  match '/featured_videos', to: 'videos#featured_videos', via: 'get'
  match '/music_videos', to: 'videos#music_videos', via: 'get'
  match '/comedic_videos', to: 'videos#comedic_videos', via: 'get'
  match '/movie_videos', to: 'videos#movie_videos', via: 'get'
  match '/web_series_videos', to: 'videos#web_series_videos', via: 'get'
  match '/talent_videos', to: 'videos#talent_videos', via: 'get'

  match '/fashion', to: 'pages#fashion', via: 'get'
  match '/newest', to: 'fashion#newest', via: 'get'
  match '/trending_fashion', to: 'fashion#trending_fashion', via: 'get'
  match '/upload', to: 'fashion#upload', via: 'get'

  match '/forum', to: 'pages#forum', via: 'get'
  match '/top_stories', to: 'forum#top_stories', via: 'get'

  match '/contact', to: 'pages#contact', via: 'get'
  match '/advertise', to: 'pages#advertise', via: 'get'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
