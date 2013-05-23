require 'spec_helper'

describe "shops/edit" do
  before(:each) do
    @shop = assign(:shop, stub_model(Shop,
      :location_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit shop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shop_path(@shop), "post" do
      assert_select "input#shop_location_id[name=?]", "shop[location_id]"
      assert_select "input#shop_name[name=?]", "shop[name]"
    end
  end
end
