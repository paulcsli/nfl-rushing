Rails.application.routes.draw do
  get 'players/index'
  root 'players#index'

  get 'players/download_csv'
end
