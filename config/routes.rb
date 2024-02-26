Rails.application.routes.draw do
  get 'profiles/show'
  #get 'users/index'
  # localhost:3000/users
  #get '/users', to: 'users#index'

  # localhost:3000/users/1
  #get '/users/:id', to: 'users#show'

  # localhost:3000/users
  #post '/users', to: 'users#create'

  # localhost:3000/users/1
  #put '/users/:id', to: 'users#update'

  # localhost:3000/users/1
  #put '/users/:id', to: 'user#destroy'

  scope '/' do
    post 'login', to: 'sessions#create'
  end
  resources :events
  scope :profiles do
    get ':username', to: "profiles#show"
  end
  resources :posts
  resources :user do
    get 'users', to: "user#posts_index"
  end


  get 'posts', to: "user#post"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end