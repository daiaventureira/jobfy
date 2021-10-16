Rails.application.routes.draw do
  devise_for :professionals 
  resources :professionals do 
    resources :profiles, only: %i[create show]
  end

  devise_for :users
  root to: 'home#index'
  resources :projects
  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
