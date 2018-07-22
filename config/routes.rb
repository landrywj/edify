Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#newsfeed'
  devise_for :users
  get '/accounts' => 'application#accounts'
  resources :buildings
  resources :rooms
  resources :educators
  resources :semesters
  resources :offerings
  resources :courses
  resources :students
  resources :comments
  resources :posts do
    resources :comments
  end
end
