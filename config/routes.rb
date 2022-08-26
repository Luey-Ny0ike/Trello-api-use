Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'boards/:id', to: 'home#show', as: 'single_board'
  post 'lists/:id/create_card', to: 'home#create_card', as: 'create_card'
end
