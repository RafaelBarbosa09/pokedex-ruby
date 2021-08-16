Rails.application.routes.draw do
  # get 'pokemons/index'
  # get 'pokemons/show'
  # get 'pokemons/create'
  # get 'pokemons/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: "poke#index"
  get 'pokemons/pokedex', to: 'pokemons#pokedex'
  resources :pokemons
end