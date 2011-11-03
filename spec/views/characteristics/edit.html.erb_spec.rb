require 'spec_helper'

describe "characteristics/edit.html.erb" do
  before(:each) do
    @characteristic = assign(:characteristic, stub_model(Characteristic))
  end

  it "renders the edit characteristic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characteristics_path(@characteristic), :method => "post" do
    end
  end
end
