class ZombiesController < ApplicationController 
  def index 
    @zombies = Zombie.all
    
  end
  
  def show
    @zombie = Zombie.find(params[:id])
  end
  
  def edit
    @zombie = Zombie.find(params[:id])
  end
  
  def update
    debugger
    # @zombie = Zombie.find(params[:id])
  end
  
  
end