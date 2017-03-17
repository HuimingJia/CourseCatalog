Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'
  post'/users(.:format)', to: 'users#create', as: 'users'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/search',   to: 'search#new'
  get '/search',   to: 'search#page'
  post '/enrollments', to: 'enrollments#create', as: 'enrollments'
  get '/enrollments', to: 'enrollments#show', as: 'enrollment'
  delete '/enrollments', to: 'enrollments#destroy'
  get '/courses',   to: 'courses#index', as: 'courses'
  get '/instructors',   to: 'instructors#index', as: 'instructors'
  get '/subjects',   to: 'subjects#index', as: 'subjects'
  get '/users/:id/edit', to: 'users#edit'
  get '/users/:id', to:  'users#show', as: 'user'
  put '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'

  # resources :courses
  # resources :instructors
  # resources :subjects
  # resources :segments
  # resources :users
  # resources :enrollments
  # resources :users do
  #   resources :enrollments
  # end
  # resources :courses do
  #   resources :enrollments
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
