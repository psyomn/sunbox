require 'spec_helper'

describe "collaborations/show" do
  before(:each) do
    @collaboration = assign(:collaboration, stub_model(Collaboration,
      :owner_id => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Description/)
  end
end
