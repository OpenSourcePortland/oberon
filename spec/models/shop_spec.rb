require 'spec_helper'
#require 'support/owning_spec.rb'

describe Shop do
  before(:each) do
    @owner = Fabricate(:shop)
    @vendor = Fabricate(:shop) 
  end
  
  let(:character) { Fabricate(:character) }
  let(:shop) { @owner }
  
  it_behaves_like "owning"
  it_behaves_like "vending"
  
end
