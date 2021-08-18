require 'rails_helper'

RSpec.describe Pokemon, :type => :model do
  before do
    @pokemon = Pokemon.create(id: 1, name: 'venusaur', img: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png')
  end

  it "deve validar id unico" do

    product_with_same_id = @pokemon.dup
    product_with_same_id.id = @pokemon.id
    product_with_same_id.save

    expect(product_with_same_id).not_to be_valid
  end

  it "deve validar nome" do
    expect(@pokemon.name).not_to eq("")
  end

  it "deve validar imagem" do
    expect(@pokemon.img).not_to eq("")
  end

  it "deve ser criado" do
    expect(@pokemon).to be_valid
  end

  it 'deve ser lido' do
    expect(Pokemon.find_by_name("venusaur")).to eq(@pokemon)
  end

  it 'deve ser excluido' do
    @pokemon.destroy
    expect(Pokemon.count).to eq(0)
  end

end