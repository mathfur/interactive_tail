# -*- encoding: utf-8 -*-

class Log < ActiveRecord::Base
  attr_accessible :contents, :location, :time, :time_in_log

  default_scope :order => 'time'
  paginates_per 100

  belongs_to :log_file

  before_save :set_time

  def set_time
    self.time = Time.now
  end

  def tags
    self.contents.scan(/\[([^]]+)\]/).flatten
  end

  def contents_after_tags
    self.contents[/\]\s*([^]]*)$/, 1] || self.contents
  end
end
