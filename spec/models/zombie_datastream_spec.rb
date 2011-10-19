require 'spec_helper'

describe ZombieDatastream do

  before do
    @ds = ZombieDatastream.from_xml('
      <zombie xmlns="http://mediashelf.com/zombies">
        <body>
          <name>Shaun</name>
          <date type="birth">1959</date>
          <date type="undeath">2011</date>
          <peopleEaten>
            <name>Bob</name>
            <name>Hannah</name>
          </peopleEaten>
          <graveyard>Cincinati</graveyard>
        </body>
      </zombie>
    ')
  end

  it "should have eaten two people" do
    @ds.people_eaten.size.should == 2
  end

  it "should have a date of birth" do
    @ds.body.date_of_birth.first.should == "1959"
    @ds.date_of_birth.first.should == "1959"
  end
  it "should have a date of undeath" do
    @ds.body.date_of_undeath.first.should == "2011"
  end

  it "should access the name" do
    @ds.body.name.should == ['Shaun']
    @ds.body.name[0].should == 'Shaun'
  end

  it "should be able to set the name" do
    @ds.body.name = 'Ash'
    @ds.body.name[0].should == 'Ash'
  end

end
