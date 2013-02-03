require 'spec_helper'

describe LogsController do
  def valid_attributes
    {
      contents: "SELECT * FROM users",
      location: nil,
      time: Time.now,
      time_in_log: Time.now,
    }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all logs as @logs" do
      log = Log.create! valid_attributes
      get :index, {}, valid_session
      assigns(:logs).should eq([log])
    end
  end

  describe "GET index_grouped_by_tags" do
    it "@logs_each_tag have logs each tag" do
      Log.create! valid_attributes.merge(:contents => "[[foo]][[bar]] abc")
      Log.create! valid_attributes.merge(:contents => "[[foo]] def")
      get :index_grouped_by_tags, {}, valid_session
      assigns(:logs_each_tag).keys.should == ["foo", "bar"]
      assigns(:logs_each_tag)["foo"].map(&:contents_after_tags).should == ["abc", "def"]
      assigns(:logs_each_tag)["bar"].map(&:contents_after_tags).should == ["abc"]
    end
  end

  describe "GET show" do
    it "assigns the requested log as @log" do
      log = Log.create! valid_attributes
      get :show, {:id => log.to_param}, valid_session
      assigns(:log).should eq(log)
    end
  end
end
