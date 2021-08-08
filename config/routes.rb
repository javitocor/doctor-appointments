Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :roles  
    resources :users, only: [:new, :create, :edit, :update, :destroy]  
  end
  resources :appointments
  resources :users, only:[:index, :show]
  
  authenticated :user do
    root to: 'appointments#index', as: :authenticated_root
  end
  root to: 'welcome#index'
  get '/search', to: 'searches#search'
end
