require 'net/http'

class PokeController < ApplicationController
  def index
    @list_pokemons = list_pokemons
  end

  def list_pokemons
    response = Net::HTTP.get(URI.parse('https://pokeapi.co/api/v2/pokemon/?limit=13'))
    
    pokemons = JSON.parse(response)
    pokemons['results'].map do | pokemon |  
      res = Net::HTTP.get(URI.parse("https://pokeapi.co/api/v2/pokemon/#{pokemon['name']}"))
      new_pokemon = JSON.parse(res)
      Pokemon.new(new_pokemon)
    end
  end

  
end