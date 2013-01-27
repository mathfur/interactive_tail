require 'spec_helper'

describe "log_files/edit" do
  before(:each) do
    @log_file = assign(:log_file, stub_model(LogFile,
      :file_name => "MyString",
      :log_type => "",
      :pos => 1,
      :limit_of_skip => 15
    ))
  end

  it "renders the edit log_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => log_files_path(@log_file), :method => "post" do
      assert_select "input#log_file_file_name", :name => "log_file[file_name]"
      assert_select "input#log_file_log_type", :name => "log_file[log_type]"
      assert_select "input#log_file_pos", :name => "log_file[pos]"
      assert_select "input#log_file_limit_of_skip", :name => "log_file[limit_of_skip]"
    end
  end
end
