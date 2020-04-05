Rails.application.routes.draw do
  get 'users/new'
  get 'favorites/index'
  get 'sessions/new'
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
