Rails.application.routes.draw do
  root "home#index"
  
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      resources :polls, except: %i[new edit]
      resource :sessions, only: [:create, :destroy]
      resources :options, only: :index
    end
  end
  
  get '*path', to: 'home#index', via: :all
end
