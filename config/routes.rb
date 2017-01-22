Rails.application.routes.draw do
  root 'games#index'

  get '/play_me' => 'games#play'
end
