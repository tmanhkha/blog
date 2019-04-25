Rails.application.routes.draw do
  get 'contact/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'posts#index'
  resources :posts do
    resources :comments
  end
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show, :update]
  resources :contacts, only: [:new, :create]
end
