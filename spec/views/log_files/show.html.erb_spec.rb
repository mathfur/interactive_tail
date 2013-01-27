require 'spec_helper'

describe "log_files/show" do
  before(:each) do
    @log_file = assign(:log_file, stub_model(LogFile,
      :file_name => "File Name",
      :log_type => "Type",
      :pos => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File Name/)
    rendered.should match(/Type/)
    rendered.should match(/1/)
  end
end
