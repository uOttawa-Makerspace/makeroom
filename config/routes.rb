Rails.application.routes.draw do
  get 'rooms/makerspace'

  get 'rooms/makerlab'

  get 'rooms/makerlounge'

  get 'rooms/brunsfield'

  resources :rooms

  devise_for :users
  root 'home#index'
  get 'home/index'

  resources :bookings do
    post :approve, on: :member
  end
end
