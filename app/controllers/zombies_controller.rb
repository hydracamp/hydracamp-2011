class ZombiesController < ApplicationController 
  def index 
    @zombies = Zombie.all
    
  end
end