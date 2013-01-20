# -*- encoding: utf-8 -*-

class Log < ActiveRecord::Base
  attr_accessible :contents, :location, :time, :time_in_log

  belongs_to :log_file
end
