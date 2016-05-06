Rails.application.routes.draw do
  root 'application#newsfeed'
  devise_for :users
  get '/accounts' => 'application#accounts'
  resources :buildings
  resources :rooms
  resources :educators
  resources :courses
  resources :students
  resources :comments
  resources :posts do
    resources :comments
  end
end
