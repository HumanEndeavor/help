require 'spec_helper'

describe "acceptors/edit.html.erb" do
  before(:each) do
    @acceptor = assign(:acceptor, stub_model(Acceptor,
      :first_name => "MyString",
      :last_name => "MyString",
      :address => "MyText",
      :zipcode => 1,
      :state_id => 1,
      :region => "MyString",
      :category_id => 1
    ))
  end

  it "renders the edit acceptor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => acceptors_path(@acceptor), :method => "post" do
      assert_select "input#acceptor_first_name", :name => "acceptor[first_name]"
      assert_select "input#acceptor_last_name", :name => "acceptor[last_name]"
      assert_select "textarea#acceptor_address", :name => "acceptor[address]"
      assert_select "input#acceptor_zipcode", :name => "acceptor[zipcode]"
      assert_select "input#acceptor_state_id", :name => "acceptor[state_id]"
      assert_select "input#acceptor_region", :name => "acceptor[region]"
      assert_select "input#acceptor_category_id", :name => "acceptor[category_id]"
    end
  end
end
