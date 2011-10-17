require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Zombie do
  
  before(:each) do
    @zombie = Zombie.create
  end
  
  after(:each) do
    @zombie.destroy
  end
  
  it "should have many tweets" do
    @zombie.should respond_to(:tweets)
    tweet = Tweet.create
    @zombie.tweets << tweet
    @zombie.tweets.should include(tweet)
    tweet.zombie.should == @zombie
  end
end