require 'spec_helper'

describe Undead do
  before do
  end

  it "should save to the repository" do
    @undead = Undead.new
    @undead.save

    @undead.pid.should_not be_nil

    @reloaded = Undead.find(@undead.pid)

    @reloaded.pid.should == @undead.pid
    
  end
  
  it "should have descMetadata" do
    Undead.new.datastreams["descMetadata"].should_not be_nil
  end
end
