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
  #User Section
  get 'user/show',to:'users#show'
  post 'updateavatar', to: 'users#update_avatar'
  post 'update',to:'users#update_user'
  get 'deleteaccount',to:'users#delete_account'
  #Orders
  get 'buy_now', to:'orders#buy_now'
  #Contacts
  post 'contact',to:'contact#create'
  #Comments
  post 'comment', to: 'comments#create'
  #Auth errors
  get 'login_required', to: 'sessions#page_requires_login'
  get 'admin_auth_required', to: 'sessions#page_requires_admin'
  #Admin Section
  get 'admin', to: 'admin#welcome'
  post 'login_admin', to: 'sessions#login_admin'
  get 'admin/product', to:'admin#product_manage'
  get 'admin/deleteproduct', to:'admin#delete_product'
  get 'admin/user', to:'admin#user_manage'
  get 'admin/deleteuser', to:'admin#delete_user'
  get 'admin/order', to:'admin#order_manage'
  get 'admin/deleteorder', to:'admin#delete_order'
  #Login & SignUp routes
  get 'login', to: 'sessions#new'
  post 'login_user', to: 'sessions#login_user'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#log_out'
  get 'authorized', to: 'sessions#page_requires_login'
  resources :products
  resources :users, only: [:new, :create]
  resources :comments


  #Index Page
  root 'homepage#index'


end
