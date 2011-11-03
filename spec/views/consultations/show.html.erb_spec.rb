require 'spec_helper'

describe "consultations/show.html.erb" do
  before(:each) do
    @consultation = assign(:consultation, stub_model(Consultation))
  end

  it "renders attributes in <p>" do
    render
  end
end
