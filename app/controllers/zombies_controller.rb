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
  
  def new
    @zombie = Zombie.new
  end
  
  def create
    @zombie = Zombie.new(params[:zombie])
    if @zombie.save
      flash[:notice] = "Created #{@zombie.name}"
    else
      flash[:error] = "Failed to create your zombie!"
    end
    redirect_to zombie_path(@zombie)
  end
  
  def update
    @zombie = Zombie.find(params[:id])
    @zombie.update_attributes(params[:zombie])
    if @zombie.save
      flash[:notice] = "Saved changes to #{@zombie.name}"
    else
      flash[:error] = "Failed to save your changes!"
    end
    redirect_to edit_zombie_path(@zombie)
  end
  
  
end