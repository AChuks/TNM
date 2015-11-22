Rails.application.routes.draw do

  get 'videos/watch'

  resources :comedies

  root 'pages#home'
  match '/videos', to: 'pages#videos', via: 'get'

  match '/watch', to: 'videos#watch', via: 'get'
  match '/vsubmit', to: 'videos#submit_video', via: 'get'
  match '/vfeatured', to: 'videos#featured_videos', via: 'get'


  match '/webseries', to: 'webseries#index', via: 'get'
  match '/comedies', to: 'comedies#index', via: 'get'
  match '/music', to: 'musics#index', via: 'get'
  match '/movies', to: 'movies#index', via: 'get'
  match '/vtalents', to: 'talent_videos#index', via: 'get'
  match '/vtrends', to: 'trend_videos#index', via: 'get'
  match '/vpopular', to: 'popular_videos#index', via: 'get'
  match '/vnewest', to: 'newest_videos#index', via: 'get'


  match '/fashion', to: 'pages#fashion', via: 'get'

  match '/fupload', to: 'fashion#upload', via: 'get'
  match '/ftrends', to: 'trend_fashions#index', via: 'get'
  match '/fnewest', to: 'newest_fashions#index', via: 'get'


  match '/forum', to: 'pages#forum', via: 'get'
  match '/top_stories', to: 'forum#top_stories', via: 'get'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/advertise', to: 'pages#advertise', via: 'get'
  match '/about', to: 'pages#about', via: 'get'
  match '/subscribe', to: 'pages#subscribe', via: 'get'
  match '/terms', to: 'pages#terms', via: 'get'





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
