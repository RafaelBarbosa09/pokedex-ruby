class Pokemon
  attr_reader :name, :img, :types

  def initialize(pokemon)
    @name = pokemon['name']
    @img = pokemon['sprites']['front_default']
    @types = pokemon['types']
    # @type_name = pokemon['types'][0]['name']
  end
end