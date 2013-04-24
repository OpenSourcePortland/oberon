require 'spec_helper'

describe User do
  
  # before do 
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
  # end
  # 
  # OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  #     :provider => 'twitter',
  #     :uid => '123545'
  #   })
  #   
  # it "should return uid" do
  #   env['omniauth.auth'].slice("provider", "uid").should == "test"
  # end  
  
  
  before(:each) do
     @auth = OmniAuth.config.mock_auth[:twitter] =
     OmniAuth.config.mock_auth[:twitter] = {
       'uid' => '123545',
       'info' => {'name' => 'todd'}
     }
   end

   it "create_from_omniauth creates a user" do
     expect{User.create_from_omniauth(@auth)}.to change{User.count}.by(1)
     #@auth["info"].should == '123545'
   end
   
   it "from_omniauth finds existing user" do
     @user = Fabricate(:user)
     auth = OmniAuth.config.mock_auth[:twitter] =
     OmniAuth.config.mock_auth[:twitter] = {
       'uid' => '1111',
       'info' => {'name' => 'existing user'}
     }
     @user2 = User.from_omniauth(auth)
     @user2.should eq(@user)
   end
end
