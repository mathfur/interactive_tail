require 'spec_helper'

describe "logs/show" do
  before(:each) do
    @log = assign(:log, stub_model(Log,
             :contents => "SELECT * FROM users;",
             :location => "UsersController#index",
             :time => Time.now,
             :time_in_log => Time.now
           ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/SELECT \* FROM users/)
    rendered.should match(/UsersController#index/)
  end
end
