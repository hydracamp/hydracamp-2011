class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.page(params[:page]).per(10)
    @tweet = Tweet.new()
  end
  
  def new
    @zombie = Zombie.find(params[:zombie_id])
    @tweet = Tweet.new()
  end
  
  def create    
    @tweet = Tweet.new(params[:tweet])    
    @tweet.zombie = Zombie.find(params[:zombie_id])
    
    if @tweet.save
      flash[:notice] = "Created tweet."
    else
      flash[:error] = "Failed to create your tweet!"
    end
    redirect_to tweets_path
  end
  
end
