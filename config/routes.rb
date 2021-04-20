Rails.application.routes.draw do
  resources :notes, only: [:new, :create, :update]
  resources :users, only: [:update, :create]

  get "/login", to: "users#login"
  post "/login", to: "users#process_login"
  post "/create", to: "users#create"
  get "/profile", to: "users#show", as: "profile"
  post "/logout", to: "users#logout", as: "logout"
  post "/edit", to: "notes#edit", as: "edit_note"
  delete "/note", to: "notes#destroy", as: "destroy_note"

  get "*path", to: redirect("/profile"), constraints: lambda { |request|
    request.session[:user_id]
  }
  get "*path", to: redirect('/login')

  get "/", to: redirect("/profile"), constraints: lambda { |request|
    request.session[:user_id]
  }
  get "/", to: redirect('/login')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
