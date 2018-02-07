AthleteRecovery::Application.routes.draw do
  devise_for :admins

    root to: 'users#index'
      get 'admin' => 'admin#index'

      namespace :admin do
        get :print_users
      end

  resources :admin
  resources :users

  get '/users' => 'users#new'
  get '/users/:id' => 'users#edit'
  post '/users/:id' => 'users#update'

end
