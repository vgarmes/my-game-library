Rails.application.routes.draw do
  devise_for :users
  resources :games
  resources :platforms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "games#index"
end
