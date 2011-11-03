require 'spec_helper'

describe "consultations/new.html.erb" do
  before(:each) do
    assign(:consultation, stub_model(Consultation).as_new_record)
  end

  it "renders new consultation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => consultations_path, :method => "post" do
    end
  end
end
