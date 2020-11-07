Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :products, except: [:show]

  namespace :api, {format: 'json'} do
    namespace :private do
      resource :products, only: [:update]
    end
  end
end
