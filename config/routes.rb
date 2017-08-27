Rails.application.routes.draw do
  root to: 'projects#show', id: 'trailblazer', onwer: 'trailblazer'

  resources :projects, only: [:index, :show]
  resources :users, only: [:show]
  resources :likes, only: [:create]
end
