require 'spec_helper'

describe "hospitals/show.html.erb" do
  before(:each) do
    @hospital = assign(:hospital, stub_model(Hospital))
  end

  it "renders attributes in <p>" do
    render
  end
end
