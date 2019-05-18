Rails.application.routes.draw do
  resources :tasks, except: :index
  root to: 'tasks#index'
end
