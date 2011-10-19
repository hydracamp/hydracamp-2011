class ZombieDatastream < ActiveFedora::NokogiriDatastream
  set_terminology do |t|
    t.root :xmlns=>'http://mediashelf.com/zombies', :path=>'zombie'
    t.body {
      t.name
      t.date_of_birth(:path=>'date', :attributes=>{'type'=>'birth'})
      t.date_of_undeath(:path=>'date', :attributes=>{'type'=>'undeath'})
      t.people(:path=>'peopleEaten') {
        t.name
      } 
    }
    t.people_eaten(:proxy=>[:body,:people, :name])
    t.date_of_birth(:proxy=>[:body, :date_of_birth])
    
  end
end
