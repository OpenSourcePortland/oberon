require 'spec_helper'

describe "shop_inventory_items/show" do
  before(:each) do
    @shop_inventory_item = assign(:shop_inventory_item, stub_model(ShopInventoryItem,
      :shop_id => 1,
      :material => "Material",
      :buy_price => 2,
      :sell_price => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Material/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
