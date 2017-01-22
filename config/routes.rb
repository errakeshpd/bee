Rails.application.routes.draw do
  root 'games#index'

  post 'play' => 'games#play'
  get '/flying_bee/:id' => 'games#flying_bee', as: 'flying_bee'
  get '/game/:id/hitme/:bee_id' => 'games#hitme'
  get '/rebuild/:id' => 'games#rebuild'
end
