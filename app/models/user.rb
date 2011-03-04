class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :checkpoint  
  
  def self.create_all
    User.destroy_all
    Checkpoint.find_each do |checkpoint|
      location = checkpoint.location
      if location =~ /'/
        location.gsub!(/'/, "")
      end
      user = User.create!(:login => location, :password => 'dynasty', :password_confirmation => 'dynasty', :checkpoint_id => checkpoint.id )
    end
    User.create(:login => 'admin', :password => 'nimda', :password_confirmation => 'nimda')
  end
  
  def admin?
    return true if self == User.find_by_login("admin")
    return false
  end
end
