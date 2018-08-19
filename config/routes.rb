Rails.application.routes.draw do
  get 'rooms/makerspace'

  get 'rooms/makerlab119'

  get 'rooms/makerlab121'

  get 'rooms/sandbox'

  get 'rooms/mill1'

  get 'rooms/lathe1'

  get 'rooms/lathe2'

  get 'rooms/welding1'

  get 'rooms/welding2'

  get 'rooms/trailer'

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
