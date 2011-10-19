class Tweet < ActiveRecord::Base
  belongs_to :zombie

  scope :ordered_chronologically, order('created_at desc')
  scope :ordered_by_zombie_name, joins(:zombie).order('zombies.name')
end
