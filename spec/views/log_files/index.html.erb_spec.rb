require 'spec_helper'

describe "log_files/index" do
  before(:each) do
    assign(:log_files, [
      stub_model(LogFile,
        :file_name => "File Name",
        :log_type => "Type",
        :pos => 1
      ),
      stub_model(LogFile,
        :file_name => "File Name",
        :log_type => "Type",
        :pos => 1
      )
    ])
  end

  it "renders a list of log_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
