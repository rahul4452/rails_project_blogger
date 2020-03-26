Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
  	resources :comments
  end 

  resources :tags

  resources :authors do
    resources :articles, shallow: true
    resources :comments, shallow: true
  end

  resources :comments do
    resources :replies
  end

  resources :author_sessions, only: [ :new, :create, :destroy ]

  # get 'login' => 'author_sessions#new'
  # get 'logout' => 'author_sessions#destroy'


  
  root to: 'articles#index'
end
