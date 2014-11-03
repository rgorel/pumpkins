
Pumpkins::Application.routes.draw do
  mount Raddocs::App => "/docs"

  scope module: :api, defaults: {format: :json}, constraints: {subdomain: 'api'} do
    namespace :v1 do
      resources :pumpkins, only: [:index, :show, :create]
      resource :sessions, only: [:create]
    end
  end
end




