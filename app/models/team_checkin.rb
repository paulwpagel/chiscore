TWENTY_MINUTES = 1200 unless defined?(TWENTY_MINUTES)
FIVE_MINUTES = 300 unless defined?(FIVE_MINUTES)

class TeamCheckin < ActiveRecord::Base
  belongs_to :team
  belongs_to :checkpoint

  named_scope :expired, lambda { |checkpoint_id|
    { :conditions => ["checkpoint_id = ? AND created_at <= ? ", checkpoint_id, (Time.now - 20.minutes)] }
  }
  
  named_scope :warning, lambda { |checkpoint_id|
    { :conditions => ["checkpoint_id = ? AND created_at >= ? and created_at <= ?", checkpoint_id, (Time.now - 20.minutes), (Time.now - 19.minutes)] }
  }
  
  named_scope :active, lambda { |checkpoint_id|
    { :conditions => ["checkpoint_id = ? AND created_at >= ? and created_at <= ?", checkpoint_id, (Time.now - 19.minutes), Time.now ] }
  }
  
  def time_left
    return in_minutes(((created_at + TWENTY_MINUTES) - Time.now).to_i)
  end
  
  def in_minutes(seconds)
    minutes = seconds / 60
    seconds = seconds % 60
    return "#{left_pad(minutes)}:#{left_pad(seconds)}"
  end
  
  def left_pad(integer)
    return "0#{integer}" if integer.to_s.size == 1
    return integer
  end
  
  
end
