Rails.application.routes.draw do
  root 'jobs#index'
  get 'about' => 'pages#about'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new', as: 'signup'
  get '/users/:user_id/profile' => 'users#profile', as: 'profile'
  resources :users, only: [:create, :edit ,:update] do
    resources :jobs, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :jobs, only: [:show]
  #get '/*other' => redirect('/')
  
end
