Rails.application.routes.draw do
  get 'players/index'
  root 'players#index'
end
