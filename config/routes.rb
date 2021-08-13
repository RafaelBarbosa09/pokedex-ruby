Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "poke#index"
  get 'poke_profile', to: 'poke#poke_profile'
end