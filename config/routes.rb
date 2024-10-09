Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :posts
  delete 'pages/unsubscribe_user/:id', to: 'pages#unsubscribe', as: 'unsubscribe_user'
  post 'pages/subscribe_user/:id', to: 'pages#subscribe', as: 'subscribe_user'
  get 'pages/index'
end
