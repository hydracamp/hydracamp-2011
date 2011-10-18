class Tweet < ActiveRecord::Base
  belongs_to :zombie
  class << self
    def all_with_latest_first
      Tweet.order("created_at DESC")
    end
  end
end
