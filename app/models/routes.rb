require 'checkpoints'

module Routes
  include Checkpoints

  def self.one
    [START, COBRA_LOUNGE, ROOTS, PHYLLIS, FIVE_STAR, MAHONEYS, FINISH]
  end

  def self.two
    [START, FIVE_STAR, DARKROOM, ROOTS, COBRA_LOUNGE, MAHONEYS, FINISH]
  end

  def self.three
    [START, ROOTS, NICKS, FIFTYFIFTY, DARKROOM, FIVE_STAR, FINISH]
  end

  def self.four
    [START, PHYLLIS, FIFTYFIFTY, NICKS, ROOTS, COBRA_LOUNGE, FINISH]
  end

  def self.five
    [START, DARKROOM, FIVE_STAR, NICKS, PHYLLIS, FIVE_STAR, FINISH]
  end

  def self.six
    [START, FIFTYFIFTY, NICKS, ROOTS, FIVE_STAR, MAHONEYS, FINISH]
  end

  def self.seven
    [START, MAHONEYS, FIVE_STAR, PHYLLIS, ROOTS, COBRA_LOUNGE, FINISH]
  end

end
