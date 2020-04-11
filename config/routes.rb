Rails.application.routes.draw do
  root :to => 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :contacts
  if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: '/letter_opener'
    end
end
