Rails.application.routes.draw do
  root 'database#index'

  resources :database do

  end
end
