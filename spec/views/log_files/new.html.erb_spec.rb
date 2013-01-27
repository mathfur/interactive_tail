require 'spec_helper'

describe "log_files/new" do
  before(:each) do
    assign(:log_file, stub_model(LogFile,
      :file_name => "MyString",
      :log_type => "",
      :pos => 1,
      :limit_of_skip => 15
    ).as_new_record)
  end

  it "renders new log_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => log_files_path, :method => "post" do
      assert_select "input#log_file_file_name", :name => "log_file[file_name]"
      assert_select "input#log_file_log_type", :name => "log_file[log_type]"
      assert_select "input#log_file_pos", :name => "log_file[pos]"
      assert_select "input#log_file_limit_of_skip", :name => "log_file[limit_of_skip]"
    end
  end
end
