Rails.application.routes.draw do
  devise_for :users

  resources :worksites do
    resources :bookings, only: [ :index]
  end

  get '/bookings', to: 'bookings#works', as: 'my_bookings'


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
