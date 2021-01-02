Rails.application.routes.draw do
  devise_for :users
  get 'pets/index'
  root to: "pets#index"
end