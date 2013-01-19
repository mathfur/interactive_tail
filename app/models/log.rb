class Log < ActiveRecord::Base
  attr_accessible :contents, :location, :time, :time_in_log
end
