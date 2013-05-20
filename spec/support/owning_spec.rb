require 'spec_helper'


shared_examples "owning" do 
  
  it "#has_any? should return true" do
     expect(@owner.has_any?(@good)).to be_true
   end
  
end
  
  # describe Shop do
  #   it_behaves_like "owning"
  # end
  # 
  # describe Character do
  #   it_behaves_like "owning"
  # end

