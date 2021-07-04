Rails.application.routes.draw do
  resources :recipes, only: [:new, :index, :show, :update, :destroy]
end
