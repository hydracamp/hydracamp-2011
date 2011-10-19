require 'spec_helper'

describe Zombie do
  
  before(:each) do
    @zombie = Zombie.create(:email=>"zombietst@example.com", :password=>"1234567", :password_confirm=>"123456")
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