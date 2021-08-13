require 'net/http'

class PokeController < ApplicationController
  def index
    @list_pokemons = list_pokemons
  end

  def poke_profile
    @pokemon = inspect_pokemon
  end

  def list_pokemons
    response = Net::HTTP.get(URI.parse('https://pokeapi.co/api/v2/pokemon/?limit=12'))
    
    pokemons = JSON.parse(response)
    pokemons['results'].map do | pokemon |  
      res = Net::HTTP.get(URI.parse("https://pokeapi.co/api/v2/pokemon/#{pokemon['name']}"))
      new_pokemon = JSON.parse(res)
      Pokemon.new(new_pokemon)
    end
  end

  def inspect_pokemon
    response = Net::HTTP.get(URI.parse("https://pokeapi.co/api/v2/pokemon/1"))
    pokemon = JSON.parse(response)
    Pokemon.new(pokemon)
  end
end