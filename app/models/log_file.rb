# -*- encoding: utf-8 -*-

class LogFile < ActiveRecord::Base
  attr_accessible :file_name, :log_type, :pos

  has_many :logs

  def save_tails
    fp = open(self.file_name, 'r')
    fp.seek(self.pos)
    while line = fp.gets
      Log.create(
        :contents => line,
        :location => nil,
        :time => Time.now,
        :time_in_log => nil
      )
    end
    self.update_attribute(:pos, fp.pos)
    fp.close
  end

  def self.save_tails
    LogFile.all.each(&:save!)
  end
end
