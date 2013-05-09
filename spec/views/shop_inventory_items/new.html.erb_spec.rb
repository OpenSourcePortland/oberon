require 'spec_helper'

describe "shop_inventory_items/new" do
  before(:each) do
    assign(:shop_inventory_item, stub_model(ShopInventoryItem,
      :shop_id => 1,
      :material => "MyString",
      :buy_price => 1,
      :sell_price => 1
    ).as_new_record)
  end

  it "renders new shop_inventory_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shop_inventory_items_path, "post" do
      assert_select "input#shop_inventory_item_shop_id[name=?]", "shop_inventory_item[shop_id]"
      assert_select "input#shop_inventory_item_material[name=?]", "shop_inventory_item[material]"
      assert_select "input#shop_inventory_item_buy_price[name=?]", "shop_inventory_item[buy_price]"
      assert_select "input#shop_inventory_item_sell_price[name=?]", "shop_inventory_item[sell_price]"
    end
  end
end
