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

  resources :users, only: [:index, :show, :update]

  resources :posts, only: [:create, :show, :index]
end
