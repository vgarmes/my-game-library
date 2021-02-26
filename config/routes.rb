Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  
  resources :games do
    collection do
      get 'search'
    end
  end
  
  resources :platforms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "games#index"
end
