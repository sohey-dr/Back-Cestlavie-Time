Rails.application.routes.draw do
  resources :recipes, only: [:new, :index, :show, :create, :update, :destroy]
end
