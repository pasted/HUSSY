require 'spec_helper'

describe "consultations/edit.html.erb" do
  before(:each) do
    @consultation = assign(:consultation, stub_model(Consultation))
  end

  it "renders the edit consultation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => consultations_path(@consultation), :method => "post" do
    end
  end
end
