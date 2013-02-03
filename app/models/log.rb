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
    self.contents.scan(/\[\[([^\]]+)\]\]/).flatten
  end

  def contents_after_tags
    self.contents[/\]\]\s*([^\]]*)$/, 1] || self.contents
  end

  # Read '(insert:foo/bar.txt:t01:15)' from contents
  # to insert 15 to t01-marked point at foo/bar.txt.
  def read_log_to_insert_to_file
    self.contents.scan(/\(insert:([^:]+):([^:]+):([^:]+)\)/).each do |fname, tag, val|
      Log.insert_string_to_file(fname, tag => val)
    end
  end
  after_save :read_log_to_insert_to_file

  def encode_contents
    self.contents = self.contents.encode(
      "UTF-8", "UTF-8", invalid: :replace, undef: :replace, replace: '.')
  end
  before_save :encode_contents

  # Example:
  #   run
  #     insert_string_to_file("foo/bar.txt", 't01' => 'abc')
  #   then
  #     arr.d('t01:').sort.uniq at file foo/bar.txt
  #   is convert to
  #     arr.d('t01:abc').sort.uniq
  def self.insert_string_to_file(target_fname, mark_value_pairs)
    raise "#{target_fname} is not found" unless File.exist?(target_fname)

    old_contents = File.read(target_fname)
    open(target_fname, 'w') do |f|
      mark_value_pairs.each do |mark, value|
        f.write old_contents.gsub(/\b#{mark}:/, "#{mark}:#{value}")
      end
    end
  end
end
