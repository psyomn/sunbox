require 'spec_helper'

describe "collaborations/edit" do
  before(:each) do
    @collaboration = assign(:collaboration, stub_model(Collaboration,
      :owner_id => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit collaboration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => collaborations_path(@collaboration), :method => "post" do
      assert_select "input#collaboration_owner_id", :name => "collaboration[owner_id]"
      assert_select "input#collaboration_description", :name => "collaboration[description]"
    end
  end
end
