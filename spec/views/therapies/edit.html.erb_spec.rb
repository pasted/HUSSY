require 'spec_helper'

describe "therapies/edit.html.erb" do
  before(:each) do
    @therapy = assign(:therapy, stub_model(Therapy,
      :name => "MyString"
    ))
  end

  it "renders the edit therapy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => therapies_path(@therapy), :method => "post" do
      assert_select "input#therapy_name", :name => "therapy[name]"
    end
  end
end
