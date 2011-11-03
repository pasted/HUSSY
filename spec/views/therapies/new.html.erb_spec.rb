require 'spec_helper'

describe "therapies/new.html.erb" do
  before(:each) do
    assign(:therapy, stub_model(Therapy,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new therapy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => therapies_path, :method => "post" do
      assert_select "input#therapy_name", :name => "therapy[name]"
    end
  end
end
