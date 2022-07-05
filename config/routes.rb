Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books
  resources :book_loans
  resources :users
  resources :students
  resources :book_requests
  resources :instructors
  # Defines the root path route ("/")
  # root "articles#index"
end
