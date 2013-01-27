require 'spec_helper'

describe Log do
  describe '#tags' do
    subject { Log.new(:contents => "[foo][bar] baz") }
    specify { subject.tags.should == ["foo", "bar"] }
  end

  describe '#contents_after_tags' do
    subject { Log.new(:contents => "[foo][bar] baz") }
    specify { subject.contents_after_tags.should == "baz" }
  end

  describe '#read_log_to_insert_to_file' do
    subject { Log.new(:contents => "[foo][bar](insert:foo/bar.txt:tag1:val1) baz") }
    specify do
      Log.should_receive(:insert_string_to_file).with('foo/bar.txt',{'tag1' => 'val1'})
      subject.read_log_to_insert_to_file
    end
  end

  describe '#insert_string_to_file' do
    specify do
      fp = Tempfile.new(['foo', '.txt'])
      fp.write "arr2 = arr.sort.t('t01:').uniq"
      fp.close

      Log.insert_string_to_file(fp.path, {"t01" => "foo"})

      fp.open
      fp.read.should == "arr2 = arr.sort.t('t01:foo').uniq"
      fp.close
    end
  end
end
