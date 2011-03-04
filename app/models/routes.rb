require "checkpoints"
module Routes
  include Checkpoints

  def self.one
    return [START, COBRA, HAPPY_TOWN, FLAT_IRON, PHYLLIS, FIVE_STAR, FINISH]
  end
  
  def self.two
    return [START, PHYLLIS, DARKROOM, FIVE_STAR, COBRA, TWISTED_SPOKE, FINISH]    
  end
  
  def self.three
    return [START, COBRA, NICKS, CLUB_LUCKY, FLAT_IRON, HAPPY_TOWN, FINISH]    
  end
  
  def self.four
    return [START, DARKROOM,	FLAT_IRON, CLUB_LUCKY, PHYLLIS, MAHONEYS,	FINISH]
  end
  
  def self.five
    return [START, MAHONEYS, HAPPY_TOWN, DARKROOM, FIVE_STAR, TWISTED_SPOKE, FINISH]    
  end
  
  def self.six
    return [START, HAPPY_TOWN, CLUB_LUCKY, PHYLLIS, DARKROOM, COBRA, FINISH]    
  end
  
  def self.seven
    return [START, TWISTED_SPOKE,	MAHONEYS,	NICKS, HAPPY_TOWN, FIVE_STAR,	FINISH]    
  end
  
  def self.eight
    return [START, FIVE_STAR, PHYLLIS, NICKS,	TWISTED_SPOKE, COBRA, FINISH]
  end

end