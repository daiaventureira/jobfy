Rails.application.routes.draw do
  devise_for :professionals 
  resources :professionals do 
    resources :profiles, only: %i[create show]
  end

  devise_for :users
  resources :users do 
    resources :projects, only: %i[show] 
  end
  root to: 'home#index'
  
  resources :projects do 
    resources :project_applications, only: %i[create show], shallow: true do 
      post 'accept', on: :member
    end
  end
  resources :project_applications

  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
