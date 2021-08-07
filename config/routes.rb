Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :users
    resources :roles
  end
  resources :appointments
  resources :users
  authenticated :user do
    root to: 'appointments#index', as: :authenticated_root
  end
  root to: 'welcome#index'
  get 'searches/search'
end
