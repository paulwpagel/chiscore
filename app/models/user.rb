class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :checkpoint
  
  def self.create_all
    User.destroy_all
    Checkpoint.all.each do |checkpoint|
      User.create(:login => checkpoint.location, :password => 'chisecret', :password_confirmation => 'chisecret', :checkpoint_id => checkpoint.id )
    end
    User.create(:login => 'admin', :password => 'nimda', :password_confirmation => 'nimda')
  end
  
  def admin?
    return true if self == User.find_by_login("admin")
    return false
  end
end
