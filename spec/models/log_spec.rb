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
end
