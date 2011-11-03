require 'spec_helper'

describe "therapies/show.html.erb" do
  before(:each) do
    @therapy = assign(:therapy, stub_model(Therapy,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
