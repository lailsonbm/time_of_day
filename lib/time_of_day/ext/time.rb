require 'active_support/core_ext/module/aliasing'
require 'active_support/core_ext/time/conversions'

class Time
  DATE_FORMATS[:time_utc] = '%H:%M:%S'
  
  def time_of_day?
    @time_of_day ||= false
  end
  
  def time_of_day
    self.dup.time_of_day!
  end
  
  def time_of_day!
    @time_of_day = true
    self
  end
  
  def not_time_of_day
    self.dup.not_time_of_day!
  end
  
  def not_time_of_day!
    @time_of_day = false
    self
  end
  
  def compare_with_time_of_day(time)
    if self.time_of_day? && time.time_of_day?
      self.seconds_since_midnight <=> time.seconds_since_midnight
    else
      self.compare_without_time_of_day(time)
    end
  rescue
    self.compare_without_time_of_day(time)
  end
  alias_method :compare_without_time_of_day, :<=>
  alias_method :<=>, :compare_with_time_of_day
  
  def to_s_with_time_of_day(format=nil)
    unless format
      to_s_without_time_of_day(:time_utc)
    else
      to_s_without_time_of_day(format)
    end
  end
  alias_method_chain :to_s, :time_of_day
end