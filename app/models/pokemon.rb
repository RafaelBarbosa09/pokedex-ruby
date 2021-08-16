class Pokemon < ApplicationRecord
  # attr_reader :id, :name, :img, :types

  # def initialize(pokemon)
  #   @id = pokemon['id']
  #   @name = pokemon['name']
  #   @img = pokemon['sprites']['front_default']
  #   @types = pokemon['types']
  # end
  validates :id, uniqueness: true
    
end