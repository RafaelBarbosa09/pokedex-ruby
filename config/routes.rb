Rails.application.routes.draw do
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/create'
  get 'pokemons/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'poke_profile', to: 'poke#poke_profile'
  root to: "poke#index"
  resources :pokemons
end