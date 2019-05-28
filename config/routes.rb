Rails.application.routes.draw do
  devise_for :users

  resources :worksites do
    resources :bookings, only: [ :index, :new, :create, :destroy, :edit, :update ]
  end

  get '/my-bookings', to: 'bookings#works', as: 'my_bookings'
  get '/my-worksites', to: 'worksites#my_worksites', as: 'my_worksites'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
