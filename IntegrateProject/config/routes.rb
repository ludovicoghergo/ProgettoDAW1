Rails.application.routes.draw do
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
  resources :products
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#index'
end
