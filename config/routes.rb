Rails.application.routes.draw do

  devise_for :users

  root to:"homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books,only: [:create, :index, :show, :destroy,:edit,:update]

  get "/home/about" => "homes#about", as: "about"

  resources :users,only: [:index, :show, :edit, :update, :destroy]

end
