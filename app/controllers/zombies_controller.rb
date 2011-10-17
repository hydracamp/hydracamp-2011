class ZombiesController < ApplicationController 
  def index 
    @zombies = Zombie.all
    
  end
  
  def show
    @zombie = Zombie.find(params[:id])
  end
end