class PokemonsController < ApplicationController
  def capture
    @pokemon = Pokemon.find(params[:id]) # grabs the pokemon's id, assigns to @pokemon 
    @pokemon.trainer = current_trainer        # sets the current_trainer (Me) to the pokemon's trainer
    @pokemon.save
    redirect_to root_path
  end

  def damage
        @pokemon = Pokemon.find(params[:id])
        @pokemon.health = @pokemon.health - 10
        @pokemon.save
        redirect_to trainer_path[:id]
  end


  def new
     @pokemon = Pokemon.new
     @pokemon.name = :name
     @pokemon.health = 100
     @pokemon.level = 1
     @pokemon.trainer = current_trainer
     @pokemon.save

     <% if @pokemon %>
     	redirect_to trainer_path
     <% else %>
     	redirect_to new_pokemon_path
     	<% flash[:notice] = "Sorry, error in saving Pokemon" %>
     	<% end %>
  end
end
