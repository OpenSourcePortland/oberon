require 'spec_helper'

describe Location do
  before(:each) do
    @location1 = Fabricate(:location, x: 2, y: 10, z: 4)
    @location2 = Fabricate(:location, x: 4, y: 4, z: 10)
    @location3 = Fabricate(:location, x: -5000, y: -10, z: -4)
    @location4 = Fabricate(:location, x: -4, y: -4, z: -10)
  end
  
  it "should not allow any nil coordintates" do
    @bad_location = Fabricate(:location)
    @bad_location.x = nil
    expect{@bad_location.save!}.to raise_error
  end
  
  it "should calculate the distance between two locations" do
    @location1.distance_to(@location2).should == 9
  end
  
  it "should calculate the distance between two negative coordinate sets" do
    @location3.distance_to(@location4).should == 4996
  end
  
  it "should calculate the distance between two a negative and positive coordinate set" do
    @location2.distance_to(@location4).should == 23
  end
  
end
  