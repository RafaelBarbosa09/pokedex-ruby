require 'net/http'

class PokemonsController < ApplicationController
  def index
    @list_pokemons = list_pokemons
  end

  def show
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
    response = Net::HTTP.get(URI.parse("https://pokeapi.co/api/v2/pokemon/#{params[:id]}"))
    pokemon = JSON.parse(response)
    Pokemon.new(pokemon)
  end

  def create
  end

  def new
  end
end