require 'spec_helper'

describe "shop_inventory_items/edit" do
  before(:each) do
    @shop_inventory_item = assign(:shop_inventory_item, stub_model(ShopInventoryItem,
      :shop_id => 1,
      :material => "MyString",
      :buy_price => 1,
      :sell_price => 1
    ))
  end

  it "renders the edit shop_inventory_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shop_inventory_item_path(@shop_inventory_item), "post" do
      assert_select "input#shop_inventory_item_shop_id[name=?]", "shop_inventory_item[shop_id]"
      assert_select "input#shop_inventory_item_material[name=?]", "shop_inventory_item[material]"
      assert_select "input#shop_inventory_item_buy_price[name=?]", "shop_inventory_item[buy_price]"
      assert_select "input#shop_inventory_item_sell_price[name=?]", "shop_inventory_item[sell_price]"
    end
  end
end
