module TimeHelper
  
  def in_minutes(seconds)
    return "" if seconds.nil?
    minutes = seconds / 60
    seconds = seconds % 60
    return "#{left_pad(minutes.to_i)}:#{left_pad(seconds.to_i)}"
  end
  
  def left_pad(integer)
    return "0#{integer}" if integer.to_s.size == 1
    return integer
  end
end