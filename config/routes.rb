Rails.application.routes.draw do
  devise_for :professionals 
  resources :professionals do 
    resources :profiles, only: %i[create show]
  end

  devise_for :users
  resources :users do 
    resources :projects, only: %i[show] do 
      post 'close', on: :member
    end 
  end
  
  root to: 'home#index'
  
  resources :projects do 
    resources :project_applications, only: %i[create show edit], shallow: true do 
      post 'accept', on: :member
      post 'reject', on: :member
    end
  end
  resources :project_applications

  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
