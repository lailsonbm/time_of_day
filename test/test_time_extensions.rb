require 'helper'

class TestTimeExtensions < Test::Unit::TestCase
  context "A Time object" do
    setup do
      @time = Time.parse('08:00')
    end
    
    should "have time of day methods" do
      assert_respond_to @time, :time_of_day?
      assert_respond_to @time, :time_of_day
      assert_respond_to @time, :time_of_day!
      assert_respond_to @time, :not_time_of_day
      assert_respond_to @time, :not_time_of_day!
    end
    
    should "be not a time of day by default" do
      assert !@time.time_of_day?
    end
    
    should "be convertible to time of day" do
      @time.time_of_day!
      assert @time.time_of_day?
    end
    
    should "be capable of generate a time of day version of itself" do
      time_of_day = @time.time_of_day
      
      assert !@time.time_of_day?
      assert time_of_day.time_of_day?
    end
    
    context "that represents a time of day" do
      setup do
        @time.time_of_day!
      end

      should "be convertible to an ordinary time object" do
        @time.not_time_of_day!
        assert !@time.time_of_day?
      end
      
      should "be capable of generate an ordinary time version of itself" do
        ordinary_time = @time.not_time_of_day
        assert @time.time_of_day?
        assert !ordinary_time.time_of_day?
      end
      
      should "compare to other time of day objects using only time information" do
        time1 = Time.parse('2000-01-01 08:00').time_of_day!
        time2 = Time.parse('2000-01-10 08:00').time_of_day!
        time3 = Time.parse('2010-06-15 10:00').time_of_day!
        assert_equal 0, (time1 <=> time2)
        assert_equal 1, (time3 <=> time1)
        assert_equal -1, (time1 <=> time3)
      end
      
      should "compare to any other time object using Time's comparison" do
        time1 = Time.parse('2005-01-01 08:00').time_of_day!
        time2 = Time.parse('2000-01-10 10:00')
        time3 = Time.parse('2010-06-15 06:00')
        assert_equal 1, (time1 <=> time2)
        assert_equal -1, (time1 <=> time3)
      end
      
      should "compare to any other object using Time's comparision" do
        assert_nothing_raised do
          assert_nil (@time <=> 'string')
          assert_nil (@time <=> :symbol)
        end
      end
      
      should "convert to string using UTC time notation when to_s is called without arguments" do
        assert_equal '08:00:00', @time.to_s
      end
    end
  end
end
