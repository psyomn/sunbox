require 'spec_helper'

describe "collaborations/index" do
  before(:each) do
    assign(:collaborations, [
      stub_model(Collaboration,
        :owner_id => 1,
        :description => "Description"
      ),
      stub_model(Collaboration,
        :owner_id => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of collaborations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
