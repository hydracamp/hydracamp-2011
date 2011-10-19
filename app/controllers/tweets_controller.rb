class TweetsController < ApplicationController
  
  def index
    if params[:sort] == 'zombie'
      @tweets = Tweet.ordered_by_zombie_name
    else
      @tweets = Tweet.ordered_chronologically
    end

    @tweets = @tweets.page(params[:page]).per(10)
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
