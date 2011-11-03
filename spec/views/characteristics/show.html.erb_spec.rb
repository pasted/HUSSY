require 'spec_helper'

describe "characteristics/show.html.erb" do
  before(:each) do
    @characteristic = assign(:characteristic, stub_model(Characteristic))
  end

  it "renders attributes in <p>" do
    render
  end
end
