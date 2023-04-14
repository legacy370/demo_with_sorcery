Rails.application.routes.draw do
  get '/secret', to: 'pages#index', as: :secret
  get 'say/hello'
  get 'say/goodbye'
  get 'welcome', to: 'welcome#index'
  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up
  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  get '/log_out', to: 'sessions#destroy', as: :log_out
  root to: 'welcome#index'
end
