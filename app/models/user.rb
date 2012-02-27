class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :checkpoint
  has_one :vote

  def self.creation_for(login, location)
    User.create!(:login => login, :password => 'Dynasty', :password_confirmation => 'Dynasty', :checkpoint_id => Checkpoint.find_by_location(location).id )
  end

  def self.create_all
    User.destroy_all
    Checkpoints::ALL.each do |location|
      creation_for(location.gsub("'s", "").gsub("/", ""), location)
    end
    User.create(:login => 'admin', :password => 'mush!', :password_confirmation => 'mush!')
  end

  def admin?
    return true if self == User.find_by_login("admin")
    return false
  end
end
