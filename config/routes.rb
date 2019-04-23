Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'
  root 'posts#index'
  resources :posts
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show, :update]
end
