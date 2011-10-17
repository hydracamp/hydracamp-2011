class CreateZombies < ActiveRecord::Migration
  def self.up
    create_table :zombies do |t|
      t.string :name
      t.string :graveyard
    end  
  end

  def self.down
    drop_table :zombies
  end
end
