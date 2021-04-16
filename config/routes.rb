Rails.application.routes.draw do
  resources :notes, only: [:new, :create, :edit, :update, :destroy, :show, :index]
  resources :users, only: [:new, :create, :update]

  # get "/notes", to: "notes#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
