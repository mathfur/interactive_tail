require 'spec_helper'

describe "logs/index" do
  before(:each) do
    logs = [
      stub_model(Log,
        :contents => "SELECT * FROM users;",
        :location => "UsersController#index",
        :time => Time.now,
        :time_in_log => Time.now
      ),
      stub_model(Log,
        :contents => "INSERT blogs (id, name) VALUES (1, suzuki)",
        :location => "BlogsController#create",
        :time => Time.now,
        :time_in_log => Time.now
      )
    ]
    logs.stub!(:current_page).and_return(1)
    logs.stub!(:total_pages).and_return(1)
    logs.stub!(:limit_value).and_return(1)
    assign(:logs, logs)
  end

  it "renders a list of logs" do
    render
    assert_select "tr>td", :text => "UsersController#index".to_s, :count => 1
    assert_select "tr>td", :text => "BlogsController#create".to_s, :count => 1
    assert_select "tr>td", :text => "SELECT * FROM users;".to_s, :count => 1
    assert_select "tr>td", :text => "INSERT blogs (id, name) VALUES (1, suzuki)".to_s, :count => 1
  end
end
