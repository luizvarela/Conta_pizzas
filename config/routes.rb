Rails3BootstrapDeviseCancan::Application.routes.draw do
  
  authenticated :user do
    root :to => 'employees#index'
  end
  root :to => "employees#index"
 
  devise_for :users
  resources :users
  resources :employees
end