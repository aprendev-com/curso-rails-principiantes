Rails.application.routes.draw do
  resources :categories, except: :show
  resources :products, path: '/'
end
