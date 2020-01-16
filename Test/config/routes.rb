Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'admin/index'
  get 'register/index'
  get 'login/index'
  get 'contact/index'
  get 'catalog/index'
  get 'about/index'
  get 'homepage/index'
  get 'catalog/show'
  get 'products/show'
  get 'users/new'
  #Comments
  post 'comment', to: 'comments#create'
  #Auth errors
  get 'login_required', to: 'sessions#page_requires_login'
  get 'admin_auth_required', to: 'sessions#page_requires_admin'
  #Admin Section
  get 'admin', to: 'admin#welcome'
  post 'login_admin', to: 'sessions#login_admin'
  #Login & SignUp routes
  get 'login', to: 'sessions#new'
  post 'login_user', to: 'sessions#login_user'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  resources :products
  resources :users, only: [:new, :create]
  resources :comments


  #Index Page
  root 'homepage#index'


end
