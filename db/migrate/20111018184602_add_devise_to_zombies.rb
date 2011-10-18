class AddDeviseToZombies < ActiveRecord::Migration
  def self.up
    change_table(:zombies) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
    
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    add_index :zombies, :email,                :unique => true
    add_index :zombies, :reset_password_token, :unique => true
    # add_index :zombies, :confirmation_token,   :unique => true
    # add_index :zombies, :unlock_token,         :unique => true
    # add_index :zombies, :authentication_token, :unique => true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration   
  end
end
