Rails.application.routes.draw do
  root to: 'comments#index'
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
