Rails.application.routes.draw do
  root to: "welcome#index"

  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
