Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :users
    resources :roles
  end
  
  resources :users
  authenticated :user do
    root to: 'users#index', as: :authenticated_root
  end
  root to: 'welcome#index'
end
