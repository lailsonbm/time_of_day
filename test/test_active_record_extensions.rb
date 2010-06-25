require 'helper'

class TestActiveRecordExtensions < Test::Unit::TestCase
  context "An attribute of type time from an active record model" do
    load_schema
    
    setup do
      @user = User.new
    end

    should "be parsed as a time of day object" do
      @user.arrive_time = '10:00'
      assert_kind_of Time, @user.arrive_time
    end
    
    should "be converted to time of day object" do
      time = Time.parse('10:00')
      @user.arrive_time = time
      assert !time.time_of_day?
      assert @user.arrive_time.time_of_day?
    end
    
    should "be loaded from database as time of day" do
      User.destroy_all
      @user.arrive_time = '10:00'
      @user.save!
      
      assert User.first.arrive_time.time_of_day?
    end
  end
  
end
