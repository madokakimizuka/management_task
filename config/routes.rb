Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'tasks#index'
  resources :tasks, except: :index
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only:[:new, :create, :show]
  namespace :admin do
   resources :users
  end
end
