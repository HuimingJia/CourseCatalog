Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/search',   to: 'search#new'
  get '/search',   to: 'search#new'

  resources :courses
  resources :instructors
  resources :subjects
  resources :segments
  resources :users
  resources :enrollments
  resources :users do
    resources :enrollments
  end
  resources :courses do
    resources :enrollments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
