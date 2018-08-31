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

  get 'rooms/stem124'

  get 'rooms/stem126'

  resources :rooms

  devise_for :users
  root 'home#index'
  get 'home/index'

  resources :bookings do
    post :approve, on: :member
    post :disapprove, on: :member
  end

  resource :user, only: [:edit] do
    post :make_admin, on: :member
    post :make_staff, on: :member
    collection do
      patch 'update_profile'
    end
  end

  namespace :admin do
    get :index, path: '/'

    resources :admin_setting, only: [:index] do
      collection do
        post 'add_organization'
        post 'remove_organization'
      end
    end

    resources :users, only: [:index, :edit] do

      collection do
        get 'search'
      end
    end


  end
end
