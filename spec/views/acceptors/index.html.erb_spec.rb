require 'spec_helper'

describe "acceptors/index.html.erb" do
  before(:each) do
    assign(:acceptors, [
      stub_model(Acceptor,
        :first_name => "First Name",
        :last_name => "Last Name",
        :address => "MyText",
        :zipcode => 1,
        :state_id => 1,
        :region => "Region",
        :category_id => 1
      ),
      stub_model(Acceptor,
        :first_name => "First Name",
        :last_name => "Last Name",
        :address => "MyText",
        :zipcode => 1,
        :state_id => 1,
        :region => "Region",
        :category_id => 1
      )
    ])
  end

  it "renders a list of acceptors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
