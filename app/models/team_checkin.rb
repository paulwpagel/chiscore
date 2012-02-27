TWENTY_MINUTES = 1200 unless defined?(TWENTY_MINUTES)
FIVE_MINUTES = 300 unless defined?(FIVE_MINUTES)

class TeamCheckin < ActiveRecord::Base
  include TimeHelper
  belongs_to :team
  belongs_to :checkpoint
  
  validates_uniqueness_of :team_id, :scope => :checkpoint_id

  scope :expired, lambda { |checkpoint_id|
    { :conditions => ["checkpoint_id = ? AND (created_at <= ? OR checkout IS NOT NULL)", checkpoint_id, (Time.now - 20.minutes)] }
  }
  
  scope :warning, lambda { |checkpoint_id|
    { :conditions => ["checkpoint_id = ? AND created_at >= ? and created_at <= ?", checkpoint_id, (Time.now - 20.minutes), (Time.now - 19.minutes)] }
  }
  
  scope :active, lambda { |checkpoint_id|
    { :conditions => ["checkpoint_id = ? AND created_at >= ? and created_at <= ? AND checkout IS NULL", checkpoint_id, (Time.now - 19.minutes), Time.now ] }
  }
  
  def time_left
    return in_minutes(((created_at + TWENTY_MINUTES) - Time.now).to_i)
  end  

  def checkout!
    update_attribute(:checkout, Time.now)
  end
  
end
