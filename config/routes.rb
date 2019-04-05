Rails.application.routes.draw do
  resources :tags
  resources :sites

  root to: 'sites#index'
end
