class Tweet < ActiveRecord::Base
  belongs_to :zombie
  default_scope :order => 'created_at DESC'
end
