Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]

      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
