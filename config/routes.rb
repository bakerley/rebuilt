Rails.application.routes.draw do
  devise_for :users

  resources :worksites do
    resources :bookings, only: [ :index]
  end

  resources :bookings, only: [ :index]


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
