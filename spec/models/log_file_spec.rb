# -*- encoding: utf-8 -*-

require 'spec_helper'

describe LogFile do
  before do
    fp = Tempfile.new(["foo", ".log"])
    fp.write ''
    fp.close
    @path = fp.path

    @log_file = LogFile.create(:file_name => @path, :type => 'rails')
  end

  specify do
    proc do
      open(@path, 'a'){|f| f.puts 'foo'}
      @log_file.save_tails
    end.should change(Log, :count).by(1)

    proc do
      open(@path, 'a'){|f| f.puts "bar\nbaz"}
      @log_file.save_tails
    end.should change(Log, :count).by(2)
  end
end
