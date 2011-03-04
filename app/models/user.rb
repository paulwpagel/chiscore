class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :checkpoint  
  
  def self.creation_for(login, location)
    User.create!(:login => login, :password => 'Dynasty', :password_confirmation => 'Dynasty', :checkpoint_id => Checkpoint.find_by_location(location) )
  end
  
  def self.create_all
    User.destroy_all
    creation_for("Start"        , Checkpoints::START)
    creation_for("Happy Village", Checkpoints::HAPPY_TOWN)
    creation_for("Innertown"    , Checkpoints::HAPPY_TOWN)
    creation_for("Cobra"        , Checkpoints::COBRA)
    creation_for("Flat Iron"    , Checkpoints::FLAT_IRON)    
    creation_for("Phyllis"      , Checkpoints::PHYLLIS)
    creation_for("Five Star"    , Checkpoints::FIVE_STAR)
    creation_for("Twisted Spoke", Checkpoints::TWISTED_SPOKE)
    creation_for("Nicks"        , Checkpoints::NICKS)
    creation_for("Darkroom"     , Checkpoints::DARKROOM)
    creation_for("Mahoneys"     , Checkpoints::MAHONEYS)
    creation_for("Club Lucky"   , Checkpoints::CLUB_LUCKY)
    creation_for("Finish"       , Checkpoints::FINISH)
    User.create(:login => 'admin', :password => 'mush!', :password_confirmation => 'mush!')
  end
  
  def admin?
    return true if self == User.find_by_login("admin")
    return false
  end
end
