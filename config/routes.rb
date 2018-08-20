Rails.application.routes.draw do
  get 'rooms/makerspace'

  get 'rooms/makerlab'

  get 'rooms/makerlounge'

  get 'rooms/brunsfield'

  get 'rooms/sandbox'

  resources :rooms

  devise_for :users
  root 'home#index'
  get 'home/index'

  resources :bookings do
    post :approve, on: :member
    post :disapprove, on: :member
  end

  resource :user, only: [:edit] do
    collection do
      patch 'update_profile'
    end
  end

  namespace :admin do
    get :index, path: '/'

  end
end
