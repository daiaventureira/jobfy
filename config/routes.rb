Rails.application.routes.draw do
  devise_for :professionals 
  resources :professionals, only: %i[show] do 
    resources :profiles, only: %i[create show]
  end

  devise_for :users
  resources :projects, only: %i[close] do 
    post 'close', on: :member
  end 
  
  root to: 'home#index'
  
  resources :projects, only: %i[create new show index ] do 
    resources :project_applications, only: %i[create show edit], shallow: true do 
      post 'accept', on: :member
      post 'reject', on: :member
    end
  end
  resources :project_applications, only: %i[ index destroy update ]

  resources :profiles, only: %i[update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
