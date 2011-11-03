require 'spec_helper'

describe "results/new.html.erb" do
  before(:each) do
    assign(:result, stub_model(Result,
      :name => "MyString",
      :category => "MyString"
    ).as_new_record)
  end

  it "renders new result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => results_path, :method => "post" do
      assert_select "input#result_name", :name => "result[name]"
      assert_select "input#result_category", :name => "result[category]"
    end
  end
end
