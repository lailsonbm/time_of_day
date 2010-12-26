require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'time_of_day'

require 'active_support/all'

class Test::Unit::TestCase
end

# ACTIVE RECORD STUFF
require 'active_record'
class User < ActiveRecord::Base; end
def load_schema
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
  
  # Avoids printing create table statements
  silence_stream(STDOUT) do |variable|
    ActiveRecord::Schema.define(:version => 1) do
      create_table :users do |t|
        t.string :name
        t.date :birth_date
        t.time :arrival_time
        t.datetime :join_datetime
        t.timestamp :last_operation_timestamp
      end
    end
  end
end



