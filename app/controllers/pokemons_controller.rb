require 'net/http'

class PokemonsController < ApplicationController
  def index
    @list_pokemons = list_pokemons
  end

  def pokedex
    @pokemons = Pokemon.all
  end

  def show
    @pokemon_show = inspect_pokemon
  end

  def list_pokemons
    response = Net::HTTP.get(URI.parse('https://pokeapi.co/api/v2/pokemon/?limit=12'))
    
    pokemons = JSON.parse(response)
    pokemons['results'].map do | pokemon |  
      res = Net::HTTP.get(URI.parse("https://pokeapi.co/api/v2/pokemon/#{pokemon['name']}"))
      new_pokemon = JSON.parse(res)
      Pokemon.new(
        id: new_pokemon['id'],
        name: new_pokemon['name'],
        img: new_pokemon['sprites']['front_default']
      )
    end
  end

  def inspect_pokemon
    response = Net::HTTP.get(URI.parse("https://pokeapi.co/api/v2/pokemon/#{params[:id]}"))
    pokemon = JSON.parse(response)
    Pokemon.new(
      id: pokemon['id'],
      name: pokemon['name'],
      img: pokemon['sprites']['front_default']
    )
  end

  def create
    response = Net::HTTP.get(URI.parse("https://pokeapi.co/api/v2/pokemon/#{params[:pokemon][:id]}"))
    pokemon_parsed = JSON.parse(response)

    pokemon = Pokemon.new(
      id: pokemon_parsed['id'],
      name: pokemon_parsed['name'],
      img: pokemon_parsed['sprites']['front_default'],
    )

    if pokemon.save
      redirect_to pokemons_url
    else
      redirect_to pokemons_url, notice: "Deu ruim"
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.present?
      @pokemon.destroy
    end
    redirect_to pokemons_pokedex_url
  end

  def new
    @pokemon = Pokemon.new
  end
end