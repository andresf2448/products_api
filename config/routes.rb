Rails.application.routes.draw do
  #create all necesary routes for CRUD (index, show, create, update, destroy)
  resources :products, except: [:update]
  post '/products/:id', to: "products#update"
  post '/users/login', to: "users#login"
end
