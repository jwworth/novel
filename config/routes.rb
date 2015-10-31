Rails.application.routes.draw do
  root 'chapters#index'
  resources :chapters, only: [:index, :show, :create]
end
