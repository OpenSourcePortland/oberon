require 'spec_helper'

describe "shop_inventory_items/index" do
  before(:each) do
    assign(:shop_inventory_items, [
      stub_model(ShopInventoryItem,
        :shop_id => 1,
        :material => "Material",
        :buy_price => 2,
        :sell_price => 3
      ),
      stub_model(ShopInventoryItem,
        :shop_id => 1,
        :material => "Material",
        :buy_price => 2,
        :sell_price => 3
      )
    ])
  end

  it "renders a list of shop_inventory_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Material".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
