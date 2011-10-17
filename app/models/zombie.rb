class Zombie < ActiveRecord::Base
  has_many :tweets
end