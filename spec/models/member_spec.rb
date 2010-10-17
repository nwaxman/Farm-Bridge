require 'spec_helper.rb'

describe "Member.csas_for_user with shares"  do
  before do
    @csa1 = Csa.new
    @csa2 = Csa.new
    @share1 = mock(Share, :csa => @csa1)
    @share2 = mock(Share, :csa => @csa2)
    @u1 = mock(User, :shares => [@share1, @share2])
  end
  
  it "should return an array" do
    Member.csas_for_user(@u1).should be_an_instance_of(Array)
  end
  
  it "should return shares" do
    Member.csas_for_user(@u1).first.should be_an_instance_of(Csa)
  end
end

describe "Member.csas_for_user without shares" do
  before do
    @user1 = User.new
  end
  
  it "should return an empty array" do
    Member.csas_for_user(@user1).should be_an_instance_of(Array)
    Member.csas_for_user(@user1).should be_empty    
  end
end

