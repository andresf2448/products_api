Rails.application.routes.draw do
  #create all necesary routes for CRUD (index, show, create, update, destroy)
  resources :products
end
