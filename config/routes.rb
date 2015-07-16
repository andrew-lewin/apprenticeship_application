Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root                 'static_pages#home'
  get 'about'       => 'static_pages#about'
  get 'suggestions' => 'suggestions#show'
  
  resources :suggestions, only: [:create, :destroy]
end
