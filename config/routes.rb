Rails.application.routes.draw do
  root 'games#index'

  post 'play' => 'games#play'
  get '/flying_bee/:id' => 'games#flying_bee', as: 'flying_bee'
end
