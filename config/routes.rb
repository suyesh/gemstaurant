Rails.application.routes.draw do
  resources :orders, only: [:index]
  resources :tables, except: [:new, :edit] do
      resources :orders, only: [:create]
  end
end
