Rails.application.routes.draw do

  resources :dbfields
  resources :dbtables
  resources :requests
  resources :sections
  resources :chapters
  resources :books

  #resources :searches
  resources :resources
  resources :site_images
  resources :site_documents
  resources :post_documents
  devise_for :users
  resources :posts
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'

  get 'publish', to: 'visitors#publish', as: 'publish'
  get 'moveup', to: 'sections#moveup', as: 'moveup'
  get 'movedown', to: 'sections#movedown', as: 'movedown'
  get 'staffguide', to: 'visitors#staff_guide', as: 'staffguide'
  get 'granteeguide', to: 'visitors#grantee_guide', as: 'granteeguide'
  get 'adminguide', to: 'visitors#admin_guide', as: 'adminguide'
  get 'submit', to: 'requests#submit', as: 'submit'
  get 'requestdash', to: 'requests#dashboard', as: 'requestdash'
  root 'requests#index'


  resources :users

end
