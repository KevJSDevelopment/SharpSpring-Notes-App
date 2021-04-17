Rails.application.routes.draw do
  resources :notes, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :users, only: [:update, :create, :show]

  get "/login", to: "users#login"
  post "/login", to: "users#process_login", as: "login_path"
  post "/create", to: "users#create", as: "create_user_path"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
