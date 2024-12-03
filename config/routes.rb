Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },

  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  patch 'details', to: 'users#update'

  resources :users, only: [:index, :show ]

  resources :posts, only: [:create, :show, :index]
end
