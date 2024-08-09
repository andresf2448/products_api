# Proyecto Meru

## Creación del proyecto
```ruby
rails new products --api --database=postgresql
```

## Carga de base de datos

```ruby
rails db:create
rails db:migrate
```

## Creación del modelo

```ruby
rails generate model Product name:string description:text price:decimal
rails db:migrate
```

## Creación del controlador

```ruby
rails generate controller Products
```

## Crear rutas

```ruby
resources :products
```

## Creación de test

```ruby
group :development, :test do
  gem 'rspec-rails'
end
```

```ruby
bundle install
rails generate rspec:install #initialize RSpec in the project
```

# Agragamos FactoryBot

```ruby
group :development, :test do
  gem 'factory_bot_rails'
end
```