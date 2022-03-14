Rails.application.routes.draw do
  get '/products', to: 'products#index'
end
