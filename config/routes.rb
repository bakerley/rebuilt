Rails.application.routes.draw do
  devise_for :users

  resources :worksites do
    resources :bookings, only: [ :index, :new, :create, :destroy ]
  end

  get '/bookings', to: 'bookings#works', as: 'my_bookings'

  # get '/worksites/:worksites_id/bookings/new', to: 'bookings#new', as: 'new_bookings'
  # post '/bookings', to: 'bookings#create'


  delete '/bookings/:id', to: 'bookings#destroy'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
