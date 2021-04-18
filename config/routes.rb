Rails.application.routes.draw do
  resources :notes, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :users, only: [:update, :create, :show]

  get "/login", to: "users#login"
  post "/login", to: "users#process_login"
  post "/create", to: "users#create"

  post "/logout", to: "users#logout", as: "logout"
  # if session[:user_id]
  get '*path' => redirect('/login')
  # else
  #   get '*path' => redirect("/user/#{session[:user_id]")
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
