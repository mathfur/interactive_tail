# -*- encoding: utf-8 -*-

class LogFile < ActiveRecord::Base
  attr_accessible :file_name, :log_type, :pos

  has_many :logs

  def save_tails
    return unless File.exist?(self.file_name)

    fp = open(self.file_name, 'r')
    fp.seek(self.start_pos)

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

  def limit_of_skip
    30000
  end

  # self.pos or forwarded self.pos
  def start_pos
    log_size = File.size(self.file_name)

    if self.pos + self.limit_of_skip < log_size
      log_size - self.limit_of_skip
    else
      self.pos
    end
  end

  def self.save_tails
    LogFile.all.each(&:save!)
  end
end
