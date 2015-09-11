Rails.application.routes.draw do
  resources :chapters
  root 'chapters#index'
end
